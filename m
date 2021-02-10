From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 10 Feb 2021 19:53:52 +0100
Subject: [Buildroot] [PATCH 1/2] package/xenomai: smp support needs at
 least armv6
In-Reply-To: <20210202205614.59303-1-romain.naour@gmail.com> (Romain Naour's
 message of "Tue, 2 Feb 2021 21:56:13 +0100")
References: <20210202205614.59303-1-romain.naour@gmail.com>
Message-ID: <87tuqjn48v.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > There are no autobuilder failures for this issue, but the following
 > defconfig:

 > BR2_arm=y
 > BR2_TOOLCHAIN_EXTERNAL=y
 > BR2_PACKAGE_XENOMAI=y
 > BR2_PACKAGE_XENOMAI_COBALT=y

 > See:
 > https://gitlab.denx.de/Xenomai/xenomai/-/blob/v3.1/lib/cobalt/arch/arm/include/asm/xenomai/features.h#L56

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>

Committed to 2020.02.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
