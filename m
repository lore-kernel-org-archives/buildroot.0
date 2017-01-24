From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Jan 2017 23:38:08 +1300
Subject: [Buildroot] [PATCH] arch: add support for OpenRISC architecture
In-Reply-To: <20170108084639.GW1913@waldemar-brodkorb.de>
References: <20170107084803.GA6034@waldemar-brodkorb.de>
 <f2295c57-e0cc-52d3-a708-5e4236ab3867@gmail.com>
 <20170108084639.GW1913@waldemar-brodkorb.de>
Message-ID: <20170124233808.59865462@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 8 Jan 2017 09:46:39 +0100, Waldemar Brodkorb wrote:

> > I'm wondering if all Binutils version (2.25.1, 2.26.1 and 2.27) can be used on
> > openRISC? Have you considered to use the openrisc fork [1] ?  
> 
> Thanks for your feedback. Yes all binutils version are working fine,
> I just double checked now. So there is no need to use the github
> version for binutils. There is no Linux gdb support, yet.
> You can't use gdbserver or gdb native for now.
> You could use gdb to debug bare metal code.

Romain made numerous other comments in his review. Could you reply to
the other comments he made?

Also, could you resend an updated version that takes into account the
comments from Romain (possibly by adjusting the commit log to explain
which gcc versions, binutils versions, gdb features, etc. are
supported), and also by splitting the thing into two patches:

 - one adding the architecture/toolchain support
 - one adding the qemu based defconfig

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
