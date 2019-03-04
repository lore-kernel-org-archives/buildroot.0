From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 04 Mar 2019 16:27:49 +0100
Subject: [Buildroot] [PATCH] config-fragments: drop old crosstool-ng
 toolchains
In-Reply-To: <20190303215712.7862-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 3 Mar 2019 22:57:11 +0100")
References: <20190303215712.7862-1-peter@korsgaard.com>
Message-ID: <87r2bmirre.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > These toolchains are very old and cause a number of autobuilder failures
 > that doesn't happen with more recent toolchains:

 > Fixes (glibc 2.18 does not provide O_TMPFILE):
 > http://autobuild.buildroot.net/results/c49e8361a1d4406eefd8fc1b35c8e5b061aa403b

 > Fixes (x86 toolchain built without libquadmath):
 > http://autobuild.buildroot.net/results/2d9724f169ccd60c7feb1cb549f1e2e1e9219ac3/

 > Use Codesourcery ARM toolchain (GCC 4.8.3) to provide a test with a old GCC
 > version.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
