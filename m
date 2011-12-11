From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 11 Dec 2011 22:16:44 +0100
Subject: [Buildroot] [PATCH 3/4] sqlite: refactor how CFLAGS are passed
	to the configure script
In-Reply-To: <1323284410-8884-3-git-send-email-s.neumann@raumfeld.com> (Sven
 Neumann's message of "Wed, 7 Dec 2011 20:00:09 +0100")
References: <1323284410-8884-1-git-send-email-s.neumann@raumfeld.com>
 <1323284410-8884-3-git-send-email-s.neumann@raumfeld.com>
Message-ID: <87iplmdd1f.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

 Sven> Change the way the SQLITE_CONF_ENV variable is constructed in
 Sven> preparation of passing other CFLAGS to the configure script.

Committed, thanks.

-- 
Bye, Peter Korsgaard
