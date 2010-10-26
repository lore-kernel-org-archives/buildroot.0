From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 26 Oct 2010 20:55:38 -0300
Subject: [Buildroot] [pull request] ethtool, gpsd, libnl, portmap, pptp,
 readline, rp-pppoe, netsnmp
Message-ID: <4CC76A7A.4060404@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


ethtool: bump to version 2.6.35
gpsd: new package
libnl: fix minor memleak, properly install library (.so wasn't +x so
strip didn't strip - now smaller)
portmap: bump to version 6.0, convert to autotargets
pptp: bump to version 1.7.2, convert to gentargets
readline: bump to version 6.1
rp-pppoe: convert to autotargets, bump to 3.10 and undeprecate
netsnmp: bump to version 5.6, make it a bit smaller

Enjoy.

-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: pull-request.txt
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101026/02cf34e2/attachment.txt>
