From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 5 Apr 2013 14:01:54 +0200
Subject: [Buildroot] Cross-Compiling out-of-tree driver
In-Reply-To: <trinity-59b60d3c-656f-45cc-86d2-b8be6566e03e-1365162059588@3capp-gmx-bs42>
References: <trinity-59b60d3c-656f-45cc-86d2-b8be6566e03e-1365162059588@3capp-gmx-bs42>
Message-ID: <CAHXCMMKat3awr8ZLNQbhBaSsCKh-88sohGQOTqOUBrvO2RcwWg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Andreas,

2013/4/5  <universeII@gmx.de>:
> Dear all,
> I'm trying to use buildroot to create a Linux system for our custom VME
> PowerPC board.
> I succeeded in modifying the kernel to run on our special hardware but I'm
> stuck in compiling a driver out-of-tree.
> In-kernel compilation is no problem but for development and debugging of
> drivers it is much simpler to be able to compile drivers quickly out-of-tree
> and insert/remove them manually.
> I started to compile a dummy driver out-of-tree on my linux PC which works
> fine. Now I'm trying to use the linux kernel inside buildroot tree (setting
> KDIR appropriately) and use the cross-compile tool from buildroot. I
> searched the buildroot documentation but only found instructions how to
> compile own applications/libraries. Also TODOs from the internet on
> cross-compiling drivers did not help.
> Maybe I just oversee some simple things
>
> Can anybody give me a hint, how to cross-compile a linux driver out-of-tree
> using buildroot?

To to this, you can try something similar to what lttng-modules does, see:
http://git.buildroot.net/buildroot/tree/package/lttng-modules/lttng-modules.mk

Regards,

-- 
Samuel
