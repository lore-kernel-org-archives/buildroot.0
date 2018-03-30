From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Mar 2018 21:26:09 +0200
Subject: [Buildroot] [PATCH] configs/freescale_mpc8315erdb: remove
 defconfig
In-Reply-To: <20180304220039.25832-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sun, 4 Mar 2018 23:00:39 +0100")
References: <20180304220039.25832-1-thomas.petazzoni@bootlin.com>
Message-ID: <87in9d4b72.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > This defconfig currently fails to build the Linux kernel:
 >   https://gitlab.com/buildroot.org/buildroot/-/jobs/55306826

 > In addition, the U-Boot build had already been removed in commit
 > 12c01e4a05c8e4f4e0c4e8b74fac7824efdc8b41
 > ("configs/freescale_mpc8315erdb: remove U-Boot build"), back in
 > October 2016, and nobody bothered fixing it.

 > This defconfig was originally contributed and maintained by Gustavo
 > Zacarias, but he is no longer active in Buildroot, and nobody
 > expressed interest in this defconfig, so let's get rid of it.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
