From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 04 Feb 2014 10:22:43 +0100
Subject: [Buildroot] [PATCH] gpm: fixes build error when makeinfo is not
	installed on host
In-Reply-To: <1391425110-16238-1-git-send-email-julien.boibessot@free.fr>
 (julien boibessot's message of "Mon, 3 Feb 2014 11:58:30 +0100")
References: <1391425110-16238-1-git-send-email-julien.boibessot@free.fr>
Message-ID: <87ha8fi658.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "julien" == julien boibessot <julien.boibessot@free.fr> writes:

 > From: Julien Boibessot <julien.boibessot@armadeus.com>
 > Tested with: make gpm MAKEINFO=no
 > Should fix http://autobuild.buildroot.net/results/fbf/fbf42eac7cf09b2f3fc93fa2134ddefcb1beea2f/build-end.log
 > Thanks to Romain Naour for pointing out the problem.

 > Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
