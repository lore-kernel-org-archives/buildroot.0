From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 06 Jun 2019 17:17:49 +0200
Subject: [Buildroot] [git commit] package/linuxptp: fix build with new
 headers
In-Reply-To: <20190526215834.59BF8815E8@busybox.osuosl.org> (Arnout
 Vandecappelle's message of "Mon, 27 May 2019 00:04:36 +0200")
References: <20190526215834.59BF8815E8@busybox.osuosl.org>
Message-ID: <87o93aivz6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=1ab26a82641399d390bab7f7407fa7646949d0a2
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > net_tstamp.h in recent kernel versions requires time.h for clockid_t.

 > Fixes:
 >   http://autobuild.buildroot.net/results/93903e8abfeaa7df0b6525033fa63e29f2c9e7ae

 > Signed-off-by: Artem Panfilov <panfilov.artyom@gmail.com>
 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
