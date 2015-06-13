From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 13 Jun 2015 19:54:58 +0200
Subject: [Buildroot] strange issue with gcc 4.9.2
In-Reply-To: <CAHvj1qa+QLFcJ6==FJEyWhYFgQXd9-ZQcB9tQv5=waiaPsvC1g@mail.gmail.com>
References: <CAHvj1qa+QLFcJ6==FJEyWhYFgQXd9-ZQcB9tQv5=waiaPsvC1g@mail.gmail.com>
Message-ID: <20150613195458.19a66470@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 13 Jun 2015 15:52:10 +0100, bruce bushby wrote:

> I'm struggling with an strange problem when building with any of the last 3
> versions of buildroot and more specifically gcc 4.9.2
> 
> Perhaps this doesn't have anything to do with buildroot, but I thought I
> would mention in case other are having the a similar issue.
> 
> I'm running on an AllWinner A13 processor.
> 
> When I use buildroot 2014.08 (gcc 4.9.1) ....everything is 100%, I am able
> to compile my uboot and the resulting "u-boot-sunxi-with-spl.bin"  executes
> without any problems.
> 
> However, from buildroot 2014.11 (gcc 4.9.2) onwards, the uboot appears to
> compile cleanly and is even the same size ...but it will not boot, after
> powering on the board I don't see anything, nothing written to the console
> etc. My builds are all scripted using the exact same defconfig, but any
> spl-uboot compiled with gcc4.9.2 cd ou

Weird. Can you provide the u-boot-sunxi-with-spl and
u-boot-sunxi-with-spl.bin files for both situations (i.e working and
non-working) ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
