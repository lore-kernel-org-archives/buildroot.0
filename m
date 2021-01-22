From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Jan 2021 09:24:22 +0100
Subject: [Buildroot] [PATCH] package/gcc: fix gcc 8.4,
 9.4 and 10.2 for sparcv8 (ss10)
In-Reply-To: <20210120230234.2086807-1-romain.naour@gmail.com> (Romain Naour's
 message of "Thu, 21 Jan 2021 00:02:34 +0100")
References: <20210120230234.2086807-1-romain.naour@gmail.com>
Message-ID: <877do59y6h.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > As reported on IRC by sephthir, the defconfig qemu_sparc_ss10_defconfig
 > doesn't work as expected. Instead it produce illegal instruction
 > messages.

 > gcc 8.3, 9.2 are the latest working gcc version.
 > git bisect between gcc 8.4 and 8.4 allowed to identify
 > the commit that introcuce the regression.

 > Reverting this patch allowed to produce a working rootfs.

 > Fixes:
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/786589934

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>

Committed to 2020.02.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
