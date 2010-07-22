From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 22 Jul 2010 18:15:25 +0200
Subject: [Buildroot] [PATCHv3] Let busybox build system do it's magic on
	CFLAGS
In-Reply-To: <4C484C90.8060100@zacarias.com.ar> (Gustavo Zacarias's message of
	"Thu, 22 Jul 2010 10:50:08 -0300")
References: <4C484C90.8060100@zacarias.com.ar>
Message-ID: <87ocdzijc2.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Take 3: avoid cluttering TARGET_MAKE_ENV for everyone.
 Gustavo> No coffee morning is a bad morning.
 Gustavo> Fix busybox package to pass CFLAGS as make env rather than opt,
 Gustavo> otherwise busybox's build system won't tweak them (which is a good thing).
 Gustavo> Thanks to Thomas Petazzoni for noticing!

Committed, thanks.

-- 
Bye, Peter Korsgaard
