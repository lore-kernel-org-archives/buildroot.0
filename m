From: Milton Soares Filho <milton.soares.filho@gmail.com>
Date: Mon, 1 Jul 2013 19:25:49 -0300
Subject: [Buildroot] ldconfig - unknown machine 40
In-Reply-To: <loom.20130628T172450-675@post.gmane.org>
References: <loom.20130628T172450-675@post.gmane.org>
Message-ID: <CAPNngRMnWn3gAo3ut1GmoVJmCh2yiGu=2sUFWWXkTrL4M-NR6Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28 June 2013 13:55, Ciar?n Rehill <cir.vfi@gmail.com> wrote:
>     /sbin/ldconfig: /lib/libnsl.so.1 is for unknown machine 40.
> [...]
> *** Firstly, anyone else seeing this?  Searching doesn't turn up much.

Me too! Trying to build a ST sh4 target using an external toolchain.
My host machine has Ubuntu 13.04 x86-64 installed and ships ldconfig
version 2.17.

> *** Most importantly, any ideas on how to successfully use Buildroot on an
> F18 machine for ARM (or any non-Intel arch, I suppose)?

Still have no idea on how to fix this issue, since my external
toolchain is pre-compiled and does not ship cross-ldconfig within it.
I have done a workaround using LD_LIBRARY_PATH on the target
initialization scripts, but assuming it's a sub-optimal solution.

Best regards.

[]s, milton
