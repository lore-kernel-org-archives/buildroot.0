From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 08 Jul 2015 23:30:21 +0200
Subject: [Buildroot] Autobuilder toolchain updates
In-Reply-To: <20150707232812.603af01f@free-electrons.com> (Thomas Petazzoni's
 message of "Tue, 7 Jul 2015 23:28:12 +0200")
References: <20150707232812.603af01f@free-electrons.com>
Message-ID: <87zj36mj6a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > I've done some updates to the toolchains in the autobuilders:

 >  * All Buildroot external toolchains have been rebuilt with today's
 >    master (commit 85945aa). This means that the default compiler
 >    version used is gcc 4.9.x. Only toolchain,
 >    br-arm-cortex-a9-glibc-2015.05-496-g85945aa.tar.bz2, is using gcc
 >    5.1.x, so that we have at least one toolchain testing this new
 >    compiler version. One toolchain, the NIOS II, could not be rebuilt
 >    with the current master as the build fails (it was working on
 >    2015.05).

Great, thanks! Does the nios issue look fixable?

-- 
Bye, Peter Korsgaard
