From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 04 May 2017 10:46:44 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
	2017-05-02
In-Reply-To: <20170504095750.7cb38619@free-electrons.com> (Thomas Petazzoni's
 message of "Thu, 4 May 2017 09:57:50 +0200")
References: <20170503062809.135BB207F9@mail.free-electrons.com>
 <CAOMZO5B9sPeE+_YH4nWykogzB_dq7XUpz0AraMXjgazZjA_DxA@mail.gmail.com>
 <CAOMZO5BbPjn9b6i1uDr01ikFsSHWy9xkzfpk7F7GhssQyCuuJw@mail.gmail.com>
 <20170504093049.27618dbf@free-electrons.com>
 <035B547B-A554-4715-A235-95E6A1E14EE9@uclibc-ng.org>
 <20170504095750.7cb38619@free-electrons.com>
Message-ID: <87r305au17.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Thu, 4 May 2017 09:48:57 +0200, Waldemar Brodkorb wrote:

 >> I wouldn't say it was wrong.
 >> We have all internal toolchains fixed and we get a good idea about the quality of the latest release.
 >> 
 >> May be it will motivate Synopsis to release a new tarball, as other important ARC Bugfixes are included
 >> in this release. 

 > Well the problem is that in the mean time, we have autobuilder failures
 > caused by this. We are about to release -rc1, so we will try to reduce
 > the number of autobuilder failures, and this will get in the way. Which
 > is why we need to find a solution here.

 > Options:

 >  (1) Synopsys quickly publishes a new pre-built toolchain with uClibc
 >      1.0.24 + wordexp

 >  (2) We disable the Synopsys toolchain from our autobuilders

I would suggest we give Synopsys a few days to do (1), and if it doesn't
get fixed / too much noise in the autobuilder results do (2).

-- 
Bye, Peter Korsgaard
