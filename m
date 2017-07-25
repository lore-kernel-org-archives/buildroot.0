From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Jul 2017 00:18:17 +0200
Subject: [Buildroot] [PATCH 1/2] package/x265: disable altivec on ppc64
In-Reply-To: <20170723200339.12575-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sun, 23 Jul 2017 22:03:38 +0200")
References: <20170723200339.12575-1-bernd.kuhls@t-online.de>
Message-ID: <87wp6ww47q.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Disable altivec support until gcc problems are fixed:
 > https://bitbucket.org/multicoreware/x265/issues/320/fail-to-build-on-power8-le#comment-34076791

 > Fixes
 > http://autobuild.buildroot.net/results/419/41910d44ff98c60a6bb9fd3b6a10bd4d0b98d646/

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2017.02.x and 2017.05.x, thanks.

-- 
Bye, Peter Korsgaard
