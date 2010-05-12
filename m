From: Will Wagner <will_wagner@carallon.com>
Date: Wed, 12 May 2010 18:15:38 +0100
Subject: [Buildroot] Status of external toolchain support
Message-ID: <4BEAE23A.2000906@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am starting work on a new target and thought I'd take a look at using 
a crosstool-NG external toolchain and I have a couple of questions about 
what is supposed to be supported.

I have successfully built an arm toolchain using eglibc and nptl (Thanks 
Yann!).

When configuring buildroot I set all my options the same as the 
toolchain, except for thread support where nptl was not an option. Does 
it matter that they don't match up? Should you even be able to set 
thread library when using an external toolchain?

When using crosstools who should build gdb? If buildroot builds it I 
have to make sure my toolchain is not read only? Can I just let 
crosstools build gdb for the host and only get buildroot to make gdb-server?

Thanks
Will
