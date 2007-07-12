From: Ulf Samuelsson <ulf@atmel.com>
Date: Thu, 12 Jul 2007 13:57:05 +0200
Subject: [Buildroot] "toolchain/patch-kernel.sh" => $(APPLY)
Message-ID: <1184241425.5175.9.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Today most packages uses the patch-kernel.sh script in toolchain.
Should this really be hardwired.
Is it OK to create a symbolic variable.

APPLY:=toolchain/patch-kernel.sh

Also, I would like to see a "script" directory.
"patch-kernel.sh" is then moved here and 
"depmod.pl" maybe belongs as well in this instead of in
target/device/x86.



Best Regards
Ulf Samuelsson.
