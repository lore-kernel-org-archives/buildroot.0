From: Michael J. Hammel <buildroot@graphics-muse.org>
Date: Sun, 10 Apr 2011 20:12:06 -0600
Subject: [Buildroot] xterm vs rxvt
Message-ID: <1302487926.6468.13.camel@kepler.graphics-muse.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I noticed rxvt was pulled back in June last year.  I've been trying to
get xterm running with 2011.02.  It builds okay but fails to run.  I've
applied two patches that showed up since 2011.02 was released but that
hasn't helped.  The best info I can get so far is that there is a malloc
failure.  I have a hunch it might be a problem with network
configuration (only loopback is enabled) and/or missing or improperly
created authorization files, but was not able to narrow it down.  Strace
didn't tell me much.

rxvt, on the other hand, builds and runs just fine.  I can find no
problems with it yet.  I have a package and patch to put it back in if
anyone wants it.  I was about to post an enhancement request when I
noticed it had already been pulled once before.

I know its old and not actively maintained, but is there something
specific about why rxvt is considered buggy?
http://git.buildroot.net/buildroot/commit/?id=bb43b2408696787ad90450c9417a2114bbf3949b
-- 
Michael J. Hammel <buildroot@graphics-muse.org>
