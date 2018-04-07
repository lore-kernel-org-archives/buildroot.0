From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 07 Apr 2018 17:42:21 +0200
Subject: [Buildroot] [git commit] support/config-fragments/autobuild:
 fix SSP in br-nios2-glibc
In-Reply-To: <20180331064928.C784F83EC4@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Sat, 31 Mar 2018 08:49:14 +0200")
References: <20180331064928.C784F83EC4@busybox.osuosl.org>
Message-ID: <87o9ivdnvm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=0e4de0f2db5f7a252d4b8a4cac752fac9ca2deb3
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Commit c8680956819fae8776d7bd6d1f0e67a7b6436672 ("toolchain: fix
 > detection of SSP support") fixed the SSP check so that it does the
 > correct thing for nios2 toolchains. While this commit fixed the
 > description of the Sourcery NIOSII toolchain, it didn't fix the
 > description for the autobuilders of the br-nios2-glibc toolchain,
 > causing some build failures. This commit adjusts br-nios2-glibc.config
 > to indicate that the toolchain doesn't have SSP support.

 > Fixes:

 >   http://autobuild.buildroot.net/results/6c44e328b7bffd8474d29d5bdf1ea109ec15f4ad/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
