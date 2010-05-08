From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 08 May 2010 14:05:40 +0200
Subject: [Buildroot] Mplayer
In-Reply-To: <AANLkTimwzzNwDOF4mOhtPDzOCvtSe9-MVpmrZHvBFveR@mail.gmail.com>
	(Bart Otten's message of "Sat, 8 May 2010 13:49:24 +0200")
References: <w2w76d09b281004291240oe35449fdz226a42e12a5097a0@mail.gmail.com>
	<4BD9E3BF.8080106@gmail.com> <8739y4agy8.fsf@macbook.be.48ers.dk>
	<AANLkTimwzzNwDOF4mOhtPDzOCvtSe9-MVpmrZHvBFveR@mail.gmail.com>
Message-ID: <87aasa7g4r.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bart" == Bart Otten <bartotten@gmail.com> writes:

Please send BR mails to the buildroot list, and not only to me.

 Peter> The problem above seems to be that it somehow end up using host headers
 Peter> (/usr/X11/) - Could you post your mplayer configure.log?

 Peter> The /usr/X11 btw looks a bit odd - What distribution is this?

 Bart> I have Slackware

 Bart> ============ Checking for X11 headers presence ============
 Bart> Result is: yes (using /usr/X11/include)

So that seems to be the problem. Could you try adding --disable-x11 to
the other --disable- lines in package/multimedia/mplayer/mplayer.mk?

-- 
Bye, Peter Korsgaard
