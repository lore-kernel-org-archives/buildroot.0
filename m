From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Jul 2019 10:17:30 +0200
Subject: [Buildroot] [PATCH] package/weston: fix build with latest
 freerdp
In-Reply-To: <20190616081920.32741-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Sun, 16 Jun 2019 10:19:20 +0200")
References: <20190616081920.32741-1-yann.morin.1998@free.fr>
Message-ID: <871ry9jlut.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Commit 942da943f3 (package/freerdp: security bump to version 2.0.0-rc4)
 > backported a patch from master, that bumps FreeRDP for security fixes.

 > However, the FreeRDP development process is, well, a bit weird, as they
 > have been in the rc phase for the past two years now (2.0.0-rc0 was on
 > 2017-07-24). As such, they still continue to do huge code refactoring
 > and cleanup and stuff, even though this is the rc phase. Their API thus
 > changed quite a bit between rc2 and rc4.

 > Thus the backport now breaks weston.

 > We do not have the problem on master or 2019.05.x, because we are using
 > a more recent weston (6.0.0) which has the fix already. But on 2019.02.x,
 > we're still using an older weston (5.0.0), which misses the fix.

 > Backport the fix from upstream.

 > Fixes (2019.02.x):
 >     http://autobuild.buildroot.net/results/5fb140acadf26b7f38d3f5c07a4f8dd4dc9acb9e
 >     http://autobuild.buildroot.org/results/b16610516a8514cf45860a48d693dd0db275e8d9

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Alexey Lukyanchuk <skif@skif-web.ru>
 > Cc: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
