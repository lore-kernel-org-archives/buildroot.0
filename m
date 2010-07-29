From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 29 Jul 2010 09:15:17 -0300
Subject: [Buildroot] [PATCH] netsnmp should depend on openssl when using it
Message-ID: <4C5170D5.7050305@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The netsnmp package should depend on openssl when using it.
Otherwise netsnmp might get built before openssl and poison the
configure cache since it's not a mandatory dependency.

-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: buildroot-netsnmp-openssl.patch
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100729/ea717e22/attachment.ksh>
