From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 28 Sep 2014 23:21:25 +0200
Subject: [Buildroot] [PATCH 3/4] package/trace-cmd: does not build on
	static onl; y, needs dlopen()
In-Reply-To: <6e627ac1abcc876371ba820aef879ecd95aa41d5.1411921550.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sun, 28 Sep 2014 18:26:29 +0200")
References: <cover.1411921550.git.yann.morin.1998@free.fr>
 <6e627ac1abcc876371ba820aef879ecd95aa41d5.1411921550.git.yann.morin.1998@free.fr>
Message-ID: <87h9zrsap6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Committed after fixing the typo in $SUBJECT, thanks.

-- 
Bye, Peter Korsgaard
