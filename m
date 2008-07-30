From: J. L. Sloan <jsloan@diag.com>
Date: Wed, 30 Jul 2008 08:07:36 -0600
Subject: [Buildroot] Buildroot for AT91RM9200-EK?
In-Reply-To: <00e101c8f1d2$e4df1330$ae9d3990$@com>
References: <00c101c8f1c9$ad9f5500$08ddff00$@com>
	<00e101c8f1d2$e4df1330$ae9d3990$@com>
Message-ID: <010101c8f24d$a36332d0$ea299870$@com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fiddling with the init= and rdinit= parameters on the command line suggests

that the kernel isn't seeing the initramfs. So at least I've got something
to

debug. I can try passing an initrd instead, or a separate initramfs instead
of the

one integrated in the kernel image.

 

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
URL: http://busybox.net/lists/buildroot/attachments/20080730/c95a2a19/attachment.htm 
