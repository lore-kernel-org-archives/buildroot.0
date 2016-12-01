From: Ajorian <arastoo.ajorian@gmail.com>
Date: Thu, 1 Dec 2016 03:37:53 -0800 (PST)
Subject: [Buildroot] problem with cups
In-Reply-To: <1480398658660-151363.post@n4.nabble.com>
References: <1480147676790-151149.post@n4.nabble.com>
 <1480163241688-151160.post@n4.nabble.com>
 <298f3527-2510-22f2-7dda-67e6db24cfab@mind.be>
 <1480398658660-151363.post@n4.nabble.com>
Message-ID: <1480592273772-151538.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi again, i solved previous problem. I patched 2 new packages, cups-filters
and foo2zjs using 2 separate patch file,  1-2-cups-filters.patch
<http://buildroot-busybox.2317881.n4.nabble.com/file/n151538/1-2-cups-filters.patch>  
and  1-3-foo2zjs.patch
<http://buildroot-busybox.2317881.n4.nabble.com/file/n151538/1-3-foo2zjs.patch> 
. in these files menu "AmvajNegar" is my customized added menu in Config.in
file. 
(if you want to test these patches it is probable that end part of
1-3-foo2zjs.patch doesn't work, so you should add green instructions
manually in the foo2zjs's Makefile!)

now i can connect the server (ip_address:631/admin) and add my hp1102
printer with foo2zjs driver using web interface. but when i send a print
test to the printer i get neither any error nor any reply from the printer
and web interface. but my error log is  error_log.error_log
<http://buildroot-busybox.2317881.n4.nabble.com/file/n151538/error_log.error_log>  
.

can any body help me, please?

thanks a lot.



-----
it seams some thing in the word is wrong!
--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/problem-with-cups-tp151149p151538.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
