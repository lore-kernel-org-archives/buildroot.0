From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Aug 2019 23:08:04 +0200
Subject: [Buildroot] [PATCH] package/imagemagick: fix host build for old
 distributions
In-Reply-To: <20190802134044.22094-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 2 Aug 2019 15:40:44 +0200")
References: <20190802134044.22094-1-peter@korsgaard.com>
Message-ID: <87woevk7d7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/5f0/5f0b85033e800c9eebc46812592966ec6826bb5d/

 > imagemagick uses clock_gettime, which was provided by librt rather than libc
 > in glibc < 2.17 - Causing link errors.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x and 2019.05.x, thanks.

-- 
Bye, Peter Korsgaard
