From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 28 Oct 2011 14:50:48 +0200
Subject: [Buildroot] proc not mouning
In-Reply-To: <CAOrAeomsFZ_dsJGCYrpH07XoHA9dqCWMQjExsZt5=L5MrynHcg@mail.gmail.com>
 (vbr vbr's message of "Fri, 21 Oct 2011 09:29:28 -0700")
References: <4D89170F.7080305@michaelburghart.de> <4D88B94A.1060609@free.fr>
 <4D88BD19.7070901@michaelburghart.de> <4D88C6B3.5010103@free.fr>
 <4D88F97B.4060605@michaelburghart.de> <20110322195502.GA8662@tarshish>
 <4D88FFC6.1010404@michaelburghart.de> <20110322200337.GB8662@tarshish>
 <4D8904BF.5060503@michaelburghart.de>
 <4D898F3C.8010603@michaelburghart.de>
 <20110323171608.GC3225@nataf.siach.name>
 <1D6034426110564DA0DEA9EE9793B383581774296C@NBE-MBX01.americas.swk.pri>
 <1D6034426110564DA0DEA9EE9793B3835817742BC0@NBE-MBX01.americas.swk.pri>
 <20110324195830.5a30d30c@surf>
 <1D6034426110564DA0DEA9EE9793B383581782088E@NBE-MBX01.americas.swk.pri>
 <CAOrAeomsFZ_dsJGCYrpH07XoHA9dqCWMQjExsZt5=L5MrynHcg@mail.gmail.com>
Message-ID: <878vo5qnyv.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "vbr" == vbr vbr <vvvg77@gmail.com> writes:

 vbr> Hi,
 vbr> I am running into a similar issue when trying to run an i386 image with
 vbr> ISO9660. Under qemu, it boots up to the point where it constantly complains
 vbr> about /dev/null and /dev/ttyS0 not being present. I am using the default
 vbr> inittab.

 vbr> I have tried using udev, mdev and devtmpfs. The kernel config has these
 vbr> options:

 vbr> CONFIG_DEVTMPFS=y
 vbr> CONFIG_DEVTMPFS_MOUNT=y

 vbr> Is there a workaround? Maybe creating them manually in inittab?

It shouldn't be needed. Could you provide a bit more details about what
you're doing exactly? Could you run 'make savedefconfig' and post the
generated defconfig file?

-- 
Bye, Peter Korsgaard
