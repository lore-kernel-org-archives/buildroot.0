From: bbj17 at gmx.de <bbj17@gmx.de>
Date: Thu, 06 Aug 2009 08:15:36 +0200
Subject: [Buildroot] v86d?
Message-ID: <20090806061536.23220@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I use v86d with buildroot without any problems.
You should configure the package: "./configure --with-x86emu" and not use lrmi. Lrmi is smaller but not supported for x86_64.?

Build it: $(MAKE) CC=$(TARGET_CC) -C $(V86D_DIR) KDIR=$(LINUX_DIR)

Bye, BC

-- 
Jetzt kostenlos herunterladen: Internet Explorer 8 und Mozilla Firefox 3 -
sicherer, schneller und einfacher! http://portal.gmx.net/de/go/chbrowser
