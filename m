From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Oct 2018 13:21:21 +0200
Subject: [Buildroot] [PATCH] libssh: fix cross compile with older cmake
In-Reply-To: <9dce5a842ebb73937268fa66a3ee699785c5ae7c.1534975110.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Thu, 23 Aug 2018 00:58:30 +0300")
References: <9dce5a842ebb73937268fa66a3ee699785c5ae7c.1534975110.git.baruch@tkos.co.il>
Message-ID: <87va5rbnf2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Old version of cmake break cross-compilation when FindThreads is used
 > because of a try_run call. Add a workaround that avoids try_run.

 > cmake bug report: https://gitlab.kitware.com/cmake/cmake/issues/16920

 > Should fix:
 > http://autobuild.buildroot.net/results/8aa/8aa2bd894416a4508ca7140f8947ff46243f8b78/
 > http://autobuild.buildroot.net/results/f2c/f2cc965bb134bf4fd9e625eb267b67c949c202fc/

 > Cc: Scott Fan <fancp2007@gmail.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2018.02.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
