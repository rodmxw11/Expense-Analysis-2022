

import java.util.regex.Pattern
import java.util.regex.Matcher

String input = 'text-001.OUT'
String year = '2021'

// 10/23  PANDORA*INTERNET RADIO PDORA.COM/BIL CA 58.87
Pattern line_item_pattern =   ~/(?m)^(\d+\/\d+)\s+(.+?)\s+([\$\+\-,\d]*\.\d\d)$\n(^(?!\d+\/\d+).*?$)?/

File lines_file = new File(input)
String file_text = lines_file.text

Closure fmt_dollars = { it?it.replaceAll(',','').replaceAll(/\$/,'').replaceAll(/\+/,''):'' }
Closure fmt_text = { it?it.replaceAll(/\s+/,' ').replaceAll('"',"'"):'' }

int line_nbr=1

// process line items
file_text.eachMatch(line_item_pattern) {
    full_match, date, description, amount, xtra
    ->
    if (xtra =~ /(?i)^(Total|PAYMENTS)/) {
       xtra = ''
    }
    /*println*/ String.format(
         '%s,%d,%s/%s,"%s","%s","%s"',
	 lines_file.name,
	 line_nbr++,
	 date,
	 year,
	 fmt_text(description),
	 fmt_dollars(amount),
	 fmt_text(xtra)
	 )
}

// ----------------------- capture other info:
//Previous Balance $5,016.87
//Payment, Credits -$9,216.87
//Purchases +$5,813.84
//Cash Advances $0.00
//Balance Transfers $0.00
//Fees Charged $0.00
//Interest Charged $0.00
//Opening/Closing Date 10/05/21 - 11/04/21
//New Balance $1,613.84

Closure find_amount = { label -> fmt_dollars(file_text.find( "(?<=${label}\\s)"+/[\$\+\-,\d]*\.\d\d/ )) }
String misc_headers = 'filename,open_date,close_date,new_bal,bonus_points,prev_bal,payments,purchases,cash_advance,fees,interest'

Pattern open_close_dates = ~/Opening\/Closing Date\s+([\d\/]+)\s+-\s+([\d\/]+)/
String open_date
String close_date
file_text.find( open_close_dates ) {
   match, open, close
   ->
   open_date = open.substring(0,5)+'20'+open.substring(5)
   close_date = close.substring(0,5)+'20'+close.substring(5)
}

String points = fmt_dollars(file_text.find( "(?i)(?<=redemption\\s)"+/[\$\+\-,\d]+/ ))

String summary_line = String.format(
    '%s,%s,%s'+(',"%s"'*8),
    lines_file.name,
    open_date,
    close_date,
    find_amount('New Balance'),
    points,   // bonus_points,
    find_amount('Previous Balance'),
    find_amount('Payment, Credits'),
    find_amount('Purchases'),
    find_amount('Cash Advances'),
    find_amount('Fees Charged'),
    find_amount('Interest Charged')
    )

println "$misc_headers\n$summary_line"

    
