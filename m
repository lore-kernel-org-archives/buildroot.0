From: Darius <augulis.darius@gmail.com>
Date: Mon, 19 Jan 2009 10:23:28 +0200
Subject: [Buildroot] Trouble with kernel patch in buildroot
Message-ID: <gl1ded$mtc$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

I want to configure buildroot for my needs. I specified advanced kernel configuration, kernel version (tarbal name) 2.6.28 and patch name patch-2.6.29-rc1.bz2.
But buildroot does not try to download and apply this patch. Why? Kernel tarbal is downloaded and extracted well, but buildroot tries to configure kernel config without patch applied.
I specified patch site http://www.kernel.org/pub/linux/kernel/v2.6/testing/ in menuconfig.

Darius A.
