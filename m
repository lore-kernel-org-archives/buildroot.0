From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 18 Jan 2019 14:03:08 +0100
Subject: [Buildroot] [PATCH 1/1] package/libftdi1: fix swig build error
 when using cmake 3.12
In-Reply-To: <20181223195714.17155-1-mark.corbin@embecosm.com> (Mark Corbin's
 message of "Sun, 23 Dec 2018 19:57:14 +0000")
References: <20181223195714.17155-1-mark.corbin@embecosm.com>
Message-ID: <87sgxq5d9v.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mark" == Mark Corbin <mark.corbin@embecosm.com> writes:

 > The build fails with 'Unable to find' swig.swg and python.swg when
 > using cmake version 3.12.

 > This commit adds a patch from upstream libftdi.

 > Fixes:
 >   http://autobuild.buildroot.net/results/cc54fec0cd6e35e99dde2f43e0eb28b9d628cd19

 > Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>

Committed to 2018.02.x and 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
