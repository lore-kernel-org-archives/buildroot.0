From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 May 2019 11:05:30 +0200
Subject: [Buildroot] [PATCH 1/1] package/ltp-testsuite: bump to version
 20190517
In-Reply-To: <20190519200852.26710-1-petr.vorel@gmail.com> (Petr Vorel's
 message of "Sun, 19 May 2019 22:08:52 +0200")
References: <20190519200852.26710-1-petr.vorel@gmail.com>
Message-ID: <874l5pxzqd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Petr" == Petr Vorel <petr.vorel@gmail.com> writes:

 > Also remove workaround deleting testcases/kernel/controllers/cpuset/.
 > Upstream commit b24f3d32c ("cpuset: Detect missing fts.h") detect fts.h
 > presence, thus it's working with '#undef __UCLIBC_HAS_FTS__'.

 > Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
 > ---
 > Tested locally (uClibc) and with test-pkg.

 > ./utils/test-pkg -p ltp-testsuite 
 >                              br-arm-full [1/6]: OK
 >                   br-arm-cortex-a9-glibc [2/6]: OK
 >                    br-arm-cortex-m4-full [3/6]: SKIPPED
 >                           br-x86-64-musl [4/6]: SKIPPED
 >                       br-arm-full-static [5/6]: OK
 >                             sourcery-arm [6/6]: OK
 > 6 builds, 2 skipped, 0 build failed, 0 legal-info failed

 > NOTE: MUSL build is work-in-progress, maybe next release.

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
