From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Mar 2018 17:20:10 +0100
Subject: [Buildroot] [PATCH 3/3] board/qemu/ppc64le-pseries: make Qemu
 command similar to ppc64-pseries
In-Reply-To: <20180303143653.16934-3-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sat, 3 Mar 2018 15:36:53 +0100")
References: <20180303143653.16934-1-thomas.petazzoni@bootlin.com>
 <20180303143653.16934-3-thomas.petazzoni@bootlin.com>
Message-ID: <87a7vpb079.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > In particular:
 >  - Explicitly specify the CPU to be used, POWER8, which matches
 >    qemu_ppc64le_pseries_defconfig

 >  - Use hard disk emulation to access the root filesystem instead of an
 >    initrd.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
