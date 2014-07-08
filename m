From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 08 Jul 2014 12:10:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/freetype: Fix removal of wrong
	include/freetype2/freetype link by host-freetype
In-Reply-To: <1404554542-2165-1-git-send-email-bernd.kuhls@t-online.de> (Bernd
 Kuhls's message of "Sat, 5 Jul 2014 12:02:22 +0200")
References: <1404554542-2165-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <87k37oyxdq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Broken by http://git.buildroot.net/buildroot/commit/package/freetype/freetype.mk?id=cc5b8e72308f523b3826ada5fe7009b722bf9a79
 > Fixes
 > http://autobuild.buildroot.net/results/b77/b770d495115f25f182463eb4623cf9ee0a0f5d68/
 > http://autobuild.buildroot.net/results/5b4/5b449a9120d4ece020e22c36299489e80ab094b9/
 > http://autobuild.buildroot.net/results/fb9/fb9ec94fc4e2dcdf894ec774bd1e5809611c56fb/
 > http://autobuild.buildroot.net/results/b12/b12989ec1c57f8cf3a2f743cc94de082692b7de6/
 > http://autobuild.buildroot.net/results/f25/f255f64c210b04368069f80402da8afaecb9464b/
 > http://autobuild.buildroot.net/results/d66/d66e80b5caab1661e1661922933a963c989d02cc/

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
