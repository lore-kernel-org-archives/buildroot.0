From: jerry at chordia.co.uk <jerry@chordia.co.uk>
Date: Thu, 28 Jan 2016 17:09:33 -0000
Subject: [Buildroot] Xenomai 3.0.1?
Message-ID: <0eb901d159ee$a8a7e900$f9f7bb00$@chordia.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Running the xenomai prepare-kernel script against an externally sourced
3.18.26 kernel. Buildroot builds a bootable kernel and working FS but the
Xenomai userland tools appear to be related to 2.X. 

 

How do I best get BR to install the latest stuff?

 

Do I modify the package to get
https://xenomai.org/downloads/xenomai/stable/latest/ instead of
http://download.gna.org/xenomai/stable/ ?

 

Or should I add as an external package?

 

Thx.

 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160128/c8304c81/attachment.html>
