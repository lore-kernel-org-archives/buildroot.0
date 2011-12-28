From: Alain-Serge Nagni <alainsergenagni@yahoo.com>
Date: Wed, 28 Dec 2011 06:48:20 -0800 (PST)
Subject: [Buildroot] I have an issue with Qt running on top of X11can you
	please help
Message-ID: <1325083700.28748.YahooMailNeo@web124914.mail.ne1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
? I built a system based on buildroot version 2011.11 for a user interface: I'm running X11 on the target. To have a nice look an feel it was decided to run Qt on top of X11. I was able to build the none embedded version of Qt and installed it on the target system.?
?When I started the qtdemo application to make sure that things a working as expected, I had these error messages on the console:

QIconvCodec::convertFromUnicode: using Latin-1 for conversion, iconv failed for BOM: Bad file descriptor
QIconvCodec::convertFromUnicode: using Latin-1 for conversion, iconv_open failed
QIconvCodec::convertToUnicode: using Latin-1 for conversion, iconv_open failed


On the application window, I could noticed that some texts were not displayed.



I did a check by running the same application on a desk top and the application run without any issue. All the texts appear fine.


Did anyone faced this issue? Do I need to activated an option in buildroot or maybe I need to build and install a module that is missing.

It looks likes the Unicode support is missing on the target? If it's the case how to provide that support on the target?


?I attached the buildroot config file to this email in case you need it.


Thanks for your help,
:-)
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111228/d3746431/attachment.html>
