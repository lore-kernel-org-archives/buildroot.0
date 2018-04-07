From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 07 Apr 2018 17:38:20 +0200
Subject: [Buildroot] [git commit] toolchain: fix detection of SSP support
In-Reply-To: <20180325205240.8BD4A83B89@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Sun, 25 Mar 2018 22:52:33 +0200")
References: <20180325205240.8BD4A83B89@busybox.osuosl.org>
Message-ID: <878t9zgh77.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=c8680956819fae8776d7bd6d1f0e67a7b6436672
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > GCC issues a warning message if -fstack-protector is passed but SSP is
 > not available, so in order to force the compilation to fail we must also
 > pass -Werror.

 > All external toolchains were verified. The only one whose configuration
 > incorrectly selected BR2_TOOLCHAIN_HAS_SSP was CodeSourcery NIOSII.

 > Fixes:
 >   http://autobuild.buildroot.net/results/ce8fe8ac9cf0db01ae15d476ea714ff176965cfb
 >   http://autobuild.buildroot.net/results/09ce8f05e28c0219f499ce55130e896cae0c8b45

 > Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
