From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 30 Sep 2010 11:45:12 -0300
Subject: [Buildroot] [SECURITY][PATCHv2] Bump quagga to 0.99.17
Message-ID: <4CA4A278.6040303@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump quagga to version 0.99.17.
[SECURITY] Fixes remote crash in bgpd.
Other fixes for ospfd, ospf6d, zebra and isisd.
Fix conflicting options in the package, enhance help, reorder options.
Should fix most breakage with randpackageconfig (Peter: ring me if you
hit another one!).
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: buildroot-quagga-0.99.17.patch
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100930/ad65b04b/attachment-0001.ksh>
