From: Wade Berrier <wberrier@gmail.com>
Date: Tue, 22 Jul 2008 14:57:56 -0600
Subject: [Buildroot] [PATCH] Fix and enable vsftpd build
In-Reply-To: <878wvt4sbh.fsf@macbook.be.48ers.dk>
References: <bbbeeccd0807220958o7e86e928g529a8c410a72d89c@mail.gmail.com>
	<878wvt4sbh.fsf@macbook.be.48ers.dk>
Message-ID: <bbbeeccd0807221357m753ee61bx7da2a125002f5214@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, Jul 22, 2008 at 1:44 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
> It still doesn't compile for me (errors out in sysdeputil.c:162),
> which seems to be why Bernhard didn't enable it to begin with judging
> from the commit msg - What arch are you compiling for?

Hrm... I'm compiling for powerpc without any issues.  (gcc 3.4.6,
uclibc 0.9.28.3, linux 2.4.31, busybox 1.11.1).

I may be switching to a 4.x compiler in the near future, and if I run
into anything I'll send another update.

>
> Anyway, it's no worse than before, so committing.
>

Thanks!

Wade
