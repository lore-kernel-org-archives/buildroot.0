From: J. L. Sloan <jsloan@diag.com>
Date: Wed, 30 Jul 2008 16:39:56 -0600
Subject: [Buildroot] Buildroot for AT91RM9200-EK?
In-Reply-To: <001101c8f281$a79baec0$f6d30c40$@com>
References: <00c101c8f1c9$ad9f5500$08ddff00$@com>	<00e101c8f1d2$e4df1330$ae9d3990$@com>
	<001101c8f281$a79baec0$f6d30c40$@com>
Message-ID: <002a01c8f295$35a7fdf0$a0f7f9d0$@com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for everyone for putting up with my nattering. I've got a shell
prompt on my AT91RM9200-EK board now.

The last problem was a severe case of irony: I had hooked up my BDI3000 to
debug an issue very early in the boot

process, fixed that, then left it hooked up not realizing I had it
configured via VECTOR CATCH to catch various traps

intended for the kernel, like data aborts that cause the kernel to map
pages. Oops. Thanks again.

 

--

 <http://www.diag.com/navigation/metadata/jsloan.html> John Sloan
Consulting Technologist

 <mailto:jsloan@diag.com> jsloan at diag.com           <http://www.diag.com/>
Digital Aggregates Corporation

+1 303 489 5178 (Mobile)
<http://www.google.com/maps?f=q&hl=en&geocode=&q=Arvada+Colorado&ie=UTF8&z=1
1&iwloc=addr&om=1> Arvada Colorado 80001-0587 USA

+1 303 940 9064 (Office)  <http://www.diag.com/> www.diag.com

 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080730/cda2972f/attachment-0001.htm 
