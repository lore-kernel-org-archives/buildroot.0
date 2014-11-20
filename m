From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Nov 2014 16:48:16 +0100
Subject: [Buildroot] [PATCH] omniorb: fix build for uclinux
In-Reply-To: <422d20cafc39916b91202d92cd2641c58b48a301.1416466169.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Thu, 20 Nov 2014 08:49:29 +0200")
References: <422d20cafc39916b91202d92cd2641c58b48a301.1416466169.git.baruch@tkos.co.il>
Message-ID: <87h9xtg9fj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Add a patch to make configure correctly identify uclinux.
 > Also, disable build of shared libraries when PREFER_STATIC_LIB is set.
 > Otherwise, build for Blackfin fails further down the road.

 > Fixes:
 > http://autobuild.buildroot.net/results/c60/c60d880b620c47f4aa03cdf2e1bb85a526242d54/
 > http://autobuild.buildroot.net/results/01f/01f4e8a27831d6817b329fa23fe0bbabd7fd01c9/
 > http://autobuild.buildroot.net/results/a96/a96a06b825c14dc9fdf738225db50bc1de8b901a/

 > And many others.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
