From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 26 Jul 2010 11:26:24 -0300
Subject: [Buildroot] [PATCHv2] Migrate net-snmp to autotargets
Message-ID: <4C4D9B10.4000602@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Migrate net-snmp to autotargets, patch version 2.
Just a small fix that adds openssl to dependencies when building with it
to avoid poisoning the configure cache.

-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: buildroot-netsnmp-autotargets.patch
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100726/211e1e88/attachment.ksh>
