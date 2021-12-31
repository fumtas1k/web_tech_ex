require "cgi"
cgi = CGI.new
cgi.out("type" => "text/html", "charset" => "utf-8") {
  get = cgi["goya"]

  data = ""
  get.split("<br>").each do |record|
    weight, give_for = record.split
    data << "<tr><td>#{weight}</td><td>#{give_for}</td></tr>"
  end

  "<html>
    <head>
      <style text='text/css'>
        table {align: center; border: 1px solid #000;}
        th { border: 1px solid #000;}
        td{ padding: 1px 10px; border: 1px solid #000;}
      </style>
    </head>
    <body>
      ゴーヤの大きさと売った相手の情報は下記になります
      <table>
        <tr>
          <th>大きさ</th>
          <th>譲渡先</th>
        </tr>
        #{data}
      </table>
    </body>
  </html>"
}