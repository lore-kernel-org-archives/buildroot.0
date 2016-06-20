From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 Jun 2016 23:35:29 +0200
Subject: [Buildroot] [git commit] python-pytablewriter: new package
In-Reply-To: <20160620211801.GC22414@free.fr> (Yann E. MORIN's message of
 "Mon, 20 Jun 2016 23:18:01 +0200")
References: <20160620205603.48C1881D8B@busybox.osuosl.org>
 <20160620211801.GC22414@free.fr>
Message-ID: <87k2hjzgpq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Yegor, Peter, All,
 > On 2016-06-20 22:52 +0200, Peter Korsgaard spake thusly:
 >> commit: https://git.buildroot.net/buildroot/commit/?id=0ba8c959239499fd4abd74c90d1f8100252b3fc0
 >> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
 >> 
 >> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 >> ---
 >> package/Config.in                                      |  1 +
 >> package/python-pytablewriter/Config.in                 | 13 +++++++++++++
 >> package/python-pytablewriter/python-pytablewriter.hash |  4 ++++
 >> package/python-pytablewriter/python-pytablewriter.mk   | 14 ++++++++++++++
 >> 4 files changed, 32 insertions(+)
 >> 
 >> diff --git a/package/Config.in b/package/Config.in
 >> index aa1da13..ce71afb 100644
 >> --- a/package/Config.in
 >> +++ b/package/Config.in
 >> @@ -758,6 +758,7 @@ menu "External python modules"
 >> source "package/python-six/Config.in"
 >> source "package/python-smbus-cffi/Config.in"
 >> source "package/python-spidev/Config.in"
 >> +	source "package/python-pytablewriter/Config.in"

 > Not in alphabetical order. ;-)

Gaah, you are right. I _DID_ check for python-dominate but somehow
missed it here. Will fix - Thanks!

-- 
Venlig hilsen,
Peter Korsgaard 
