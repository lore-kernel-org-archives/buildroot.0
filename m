From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 24 Aug 2018 10:23:38 +0200
Subject: [Buildroot] [git commit] configs/raspberrypi2: increase ext4
 filesystem size
In-Reply-To: <20180812140405.D895F8C437@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Sun, 12 Aug 2018 16:09:28 +0200")
References: <20180812140405.D895F8C437@busybox.osuosl.org>
Message-ID: <87o9dskwad.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=272bf797c9c4d67154316619ff6fcadb63d38511
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > The default size of the ext4 filesystem is no longer sufficient to
 > hold all the kernel modules built by the RPi Linux kernel
 > configuration. Let's increase to 120 MB, like we did for
 > raspberrypi3_defconfig.

 > Fixes:

 >   https://gitlab.com/buildroot.org/buildroot/-/jobs/88314938

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.02.x and 2018.05.x, thanks.

-- 
Bye, Peter Korsgaard
