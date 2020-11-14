From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Nov 2020 12:19:58 +0100
Subject: [Buildroot] [PATCH] support/testing/test_syslinux: add missing
 Kconfig symbol
In-Reply-To: <20201110205651.1135087-1-romain.naour@gmail.com> (Romain Naour's
 message of "Tue, 10 Nov 2020 21:56:51 +0100")
References: <20201110205651.1135087-1-romain.naour@gmail.com>
Message-ID: <87sg9cb2xt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y is needed to use the
 > custom external toolchain x86-i686--glibc--bleeding-edge-2018.11-1.tar.bz2

 > Otherwise the symbol BR2_TOOLCHAIN_EXTERNAL_URL is lost.

 > Fixes:
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/830981734
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/830981733

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>

Committed to 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
