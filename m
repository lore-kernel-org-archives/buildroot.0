From: Stephen Agate <stephen.agate@talktalk.net>
Date: Fri, 1 Jul 2016 16:22:18 +0000 (UTC)
Subject: [Buildroot] Unable to compile uboot v2012.10 on Buildroot
	2016.05
References: <1249010753.7483898.1467378648497.JavaMail.zimbra@datacom.ind.br>
Message-ID: <loom.20160701T182040-234@post.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Carlos,

You are probably missing "include/linux/compiler-gcc5.h".

This one may work for you:

https://github.com/altera-opensource/u-boot-socfpga
/commit/d3c9a256d6445129d01d1ea779d2587523190427

S.
