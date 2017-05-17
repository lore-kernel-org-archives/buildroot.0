From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 May 2017 22:45:37 +0200
Subject: [Buildroot] [git commit] ntp: add patch to fix -fPIC issue
In-Reply-To: <20170517194628.761F38267D@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Wed, 17 May 2017 21:46:14 +0200")
References: <20170517194628.761F38267D@busybox.osuosl.org>
Message-ID: <878tlv43gu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=7fde83cdf0da338937dae13144eea2923e5c2730
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > This commit adds a patch that fixes the build on AArch64 and MIPS of the
 > ntp package, which was caused by some parts of ntp being built without
 > -fPIC.

 > Fixes:

 >   [aarch64] http://autobuild.buildroot.net/results/866b1d28595efd8b6becf83d0a64b596538d58b0
 >   [mips]    http://autobuild.buildroot.net/results/c2a945855172970736a8ffea9c564f029a023344

 > Thanks to Romain Naour for the initial analysis.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
