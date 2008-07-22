From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 22 Jul 2008 21:44:34 +0200
Subject: [Buildroot] [PATCH] Fix and enable vsftpd build
In-Reply-To: <bbbeeccd0807220958o7e86e928g529a8c410a72d89c@mail.gmail.com>
	(Wade Berrier's message of "Tue\, 22 Jul 2008 10\:58\:39 -0600")
References: <bbbeeccd0807220958o7e86e928g529a8c410a72d89c@mail.gmail.com>
Message-ID: <878wvt4sbh.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Wade" == Wade Berrier <wberrier@gmail.com> writes:

 Wade> Hi, 

 Wade> I see that vsftpd is included, but it was not enabled.  It
 Wade> also didn't build because of the missing _TARGET_BINARY
 Wade> directive.

Thanks.

 Wade> Attached is a patch to fix this (as well as add the correct
 Wade> link flags for ssl depending if that's selected).

It still doesn't compile for me (errors out in sysdeputil.c:162),
which seems to be why Bernhard didn't enable it to begin with judging
from the commit msg - What arch are you compiling for?

Anyway, it's no worse than before, so committing.

-- 
Bye, Peter Korsgaard
