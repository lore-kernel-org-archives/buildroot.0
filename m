From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 07 Jun 2021 23:17:34 +0200
Subject: [Buildroot] [git commit] package/python-bluezero: add recursive
 dependencies
In-Reply-To: <20210521085447.0BE2A86AE6@busybox.osuosl.org> (Arnout
 Vandecappelle's message of "Fri, 21 May 2021 11:12:30 +0200")
References: <20210521085447.0BE2A86AE6@busybox.osuosl.org>
Message-ID: <87mts1wf0x.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=e2bcf6605a540ff370479dffe94cd26ee6df2c6e
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > python-bluezero selects python-gobject but fails to include its arch and
 > toolchain dependencies. Add them now, as well as the corresponding
 > comment.

 > dbus-python also has some dependencies, but all of them are covered by
 > the python3 dependency, so don't bother with those.

 > Fixes: 8bdc5e7c4d975193b1e18999ed840507cea63bd6

 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
