From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 29 Aug 2011 22:45:18 +0200
Subject: [Buildroot] [PATCH 2/2] Fix regression in Python build on 64
	bits system.
In-Reply-To: <1314633404-27073-1-git-send-email-maxime.ripard@free-electrons.com>
 (Maxime Ripard's message of "Mon, 29 Aug 2011 17:56:44 +0200")
References: <1314633404-27073-1-git-send-email-maxime.ripard@free-electrons.com>
Message-ID: <87ty90ne01.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Ripard <maxime.ripard@free-electrons.com> writes:

 Maxime> Commit 009d8fceab4db7815502e4b0565fe0ef531d512c introduced
 Maxime> --enable-shared --disable-static options for the host autotools
 Maxime> packages, ultimately causing a regression on the host-python
 Maxime> build, leading to a number of critical modules not being built
 Maxime> on the target python on 64 bits system. Introduce a quick fix
 Maxime> for the release and before a deeper fix.

Committed, thanks.

-- 
Bye, Peter Korsgaard
