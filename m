From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 Jul 2017 23:55:50 +0200
Subject: [Buildroot] [PATCH 2/3] fs/squashfs: align size to 1MiB
In-Reply-To: <20170711214837.GC2991@scaer> (Yann E. MORIN's message of "Tue,
 11 Jul 2017 23:48:37 +0200")
References: <cover.1499703968.git.yann.morin.1998@free.fr>
 <03816ee56333f1eddb6ca8a048aea947fc027963.1499703968.git.yann.morin.1998@free.fr>
 <20170710232439.7dba43f1@windsurf.lan> <20170710213516.GB22898@scaer>
 <87pod6rak1.fsf@dell.be.48ers.dk> <20170711204204.GA2991@scaer>
 <2a123420-ecda-47a0-c0c3-155e3ad77f07@mind.be>
 <20170711214837.GC2991@scaer>
Message-ID: <874luir63d.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 > Thomas, so what do you want to do in the runtime testing infra: I would
 > be wary to add a call to truncate in all cases that generate a squashfs
 > image (I already have 6 of them).

 > Would it be acceptable that the emulator class first truncates its input
 > image to pad it to a 1MiB boundary, whatever the input image?

Or perhaps just not use a qemu machine variant that emulates a sdcard?
E.G. I didn't have any issues with the versatile defconfig.

-- 
Bye, Peter Korsgaard
