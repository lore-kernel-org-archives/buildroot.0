From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 Jan 2018 21:48:12 +0100
Subject: [Buildroot] [PATCH] e2fsprogs: fix build for big-endian targets
In-Reply-To: <3fce58cd3f9cb7a180135ebc04cae4598489a59e.1515868454.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Sat, 13 Jan 2018 20:34:14 +0200")
References: <3fce58cd3f9cb7a180135ebc04cae4598489a59e.1515868454.git.baruch@tkos.co.il>
Message-ID: <87y3kysvar.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Add upstream patch fixing two issues with big-endian target build.
 > Fixes:
 > http://autobuild.buildroot.net/results/33f/33f54b271843f926c94b8261b0d7e708987da407/
 > http://autobuild.buildroot.net/results/0f0/0f01192b03049f2042d318b3a2589ecc19d1cdd7/
 > http://autobuild.buildroot.net/results/4d2/4d2c5457a9c9a31d86409ca78fbc6d776fba6248/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
