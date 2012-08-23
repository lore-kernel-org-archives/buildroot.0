From: Evade Flow <evadeflow@gmail.com>
Date: Thu, 23 Aug 2012 12:14:42 -0400
Subject: [Buildroot] "Incorrect selection of the C library" with
 Emdebian toolchain
In-Reply-To: <20120823105029.666a7056@skate>
References: <5035736C.1020205@gmail.com> <20120823105029.666a7056@skate>
Message-ID: <503656F2.8020906@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 8/23/12 4:50 AM, Thomas Petazzoni wrote:
> Normally, toolchains installed system-wide in /usr are not usable
> because their sysroot is mixed with tons of stuff. However, in this
> case, it sounds like the Emdebian toolchain sysroot
> in /usr/arm-linux-gnueabi is clean and may be used by Buildroot. If you
> can't cook a patch to fix this, I'll try to find some time to do it,
> but I don't know when.

I'll try to put together a patch if the Emdebian toolchain does, in
fact, work. (I'm still doing a few sit-ups to verify this...)
