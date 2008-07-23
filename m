From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 23 Jul 2008 12:35:43 +0200
Subject: [Buildroot] [PATCH] grep intl link fix
In-Reply-To: <bbbeeccd0807221502i366ad0e6j4f6ef11a6c9e0a06@mail.gmail.com>
	(Wade Berrier's message of "Tue\, 22 Jul 2008 16\:02\:49 -0600")
References: <bbbeeccd0807221305l471d1cd3s77cc1e435cb800ca@mail.gmail.com>
	<bbbeeccd0807221502i366ad0e6j4f6ef11a6c9e0a06@mail.gmail.com>
Message-ID: <87vdywyjk0.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Wade" == Wade Berrier <wberrier@gmail.com> writes:

 Wade> Oops, I missed a grep.mk change that applies that patch :(
 Wade> Here's an updated patch.

NAK, libintl linking is handled by INTLLIBS. Configure finds it ok if
locale support is enabled, and it isn't needed otherwise. See my
recent grep commits for details.

-- 
Bye, Peter Korsgaard
