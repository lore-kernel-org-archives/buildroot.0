From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 02 Aug 2019 22:55:52 +0200
Subject: [Buildroot] [PATCH 3/6] confis/qemu_mips64r6*_malta: use the
 default compiler version (gcc 8.x)
In-Reply-To: <20190802130937.12591-3-romain.naour@smile.fr> (Romain Naour's
 message of "Fri, 2 Aug 2019 15:09:33 +0200")
References: <20190802130937.12591-1-romain.naour@smile.fr>
 <20190802130937.12591-3-romain.naour@smile.fr>
Message-ID: <87blx7qobr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@smile.fr> writes:

 > Theses defconfig was added at the when gcc 6 was not the default version
 > used by Buildroot, so the gcc version was explicitely set.

 > Since then, gcc 8.x is used as the default. So drop BR2_GCC_VERSION_6_X.

 > Tested with Qemu 2.8.1 (Debian 1:2.8+dfsg-6+deb9u7)
 > qemu_mips32r6_malta_defconfig
 > qemu_mips32r6el_malta_defconfig
 > qemu_mips64r6_malta_defconfig
 > qemu_mips64r6el_malta_defconfig

 > Signed-off-by: Romain Naour <romain.naour@smile.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
