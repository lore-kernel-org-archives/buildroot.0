From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Mar 2018 21:16:33 +0200
Subject: [Buildroot] [git commit branch/next] support/config-fragments:
 add internal defconfigs for glibc and musl
In-Reply-To: <20180205214818.7A8A98845F@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Mon, 5 Feb 2018 22:45:17 +0100")
References: <20180205214818.7A8A98845F@busybox.osuosl.org>
Message-ID: <87h8ox5q7i.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=6030986311434d554635761925925bfd351b836b
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

 > While we have several defconfigs building internal toolchains with
 > uClibc, we don't have any building internal toolchain with glibc and
 > musl. However, having such defconfigs is nice when we bump the C
 > library version, in order to immediately get feedback on build
 > failures.

 > Note that while the ARC internal defconfig uses glibc, it uses the
 > special ARC glibc version, so it doesn't test version bumps of the
 > upstream glibc C library.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
