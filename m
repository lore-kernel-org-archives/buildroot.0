From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 01 Sep 2019 11:37:09 +0200
Subject: [Buildroot] [PATCH 0/7] Remove broken defconfigs
In-Reply-To: <20190829120051.22415-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Thu, 29 Aug 2019 14:00:44 +0200")
References: <20190829120051.22415-1-thomas.petazzoni@bootlin.com>
Message-ID: <87k1asfjcq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Hello,
 > This patch series removes a number of defconfigs which currently fail
 > to build and have not been fixed. Since we're about to release
 > 2019.08, we need to get rid of them.

 >  - ts4800 doesn't build because the kernel is too old to build with
 >    gcc 8.x. The original submitter has not replied to the several
 >    pings, including to the patch proposing to add him as a contact for
 >    this defconfig in our DEVELOPERS file.

 >  - all the other defconfigs do not build because ATF needs to build a
 >    piece of ARM32 bare-metal code, but since the system is ARM64,
 >    Buildroot only provides an ARM64 toolchain. The solution is to
 >    create a separate Buildroot package for an ARM32 bare-metal
 >    toolchain. This has been discussed on the list, but need some
 >    effort that does not fit before 2019.08 is released.

 > Best regards,

 > Thomas Petazzoni

 > Thomas Petazzoni (7):
 >   configs/ts4800: remove defconfig
 >   boot/ts4800-mrboot: remove package
 >   configs/nanopc_t4: remove defconfig
 >   configs/nanopi_neo4: remove defconfig
 >   configs/nanopi_m4: remove defconfig
 >   configs/pine64_rockpro64: remove defconfig
 >   configs/radxa_rock_pi4: remove defconfig

Committed all 7, thanks.

-- 
Bye, Peter Korsgaard
