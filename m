From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 07 Jul 2010 23:39:45 +0200
Subject: [Buildroot] init: I won't write compressed data to a terminal.
In-Reply-To: <871vbf585n.fsf@macbook.be.48ers.dk> (Peter Korsgaard's message
	of "Wed, 07 Jul 2010 22:49:56 +0200")
References: <4C33AB4E.9050604@gmx.net>
	<AANLkTimdJ34gAH-YTjfOkW_iEsKZyRvBVnbLIS55oMdd@mail.gmail.com>
	<4C34E18F.4080109@gmx.net> <87aaq358x1.fsf@macbook.be.48ers.dk>
	<4C34E693.9040307@gmx.net> <871vbf585n.fsf@macbook.be.48ers.dk>
Message-ID: <87wrt73ra6.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <jacmet@uclibc.org> writes:

Hi,

 Peter> No, it's because it's bzip2 instead of busybox.

 Peter> I'm doing a test build right now to see what goes wrong.

Ok, worked around in git. Could you update your tree and test a CLEAN
rebuild?

-- 
Bye, Peter Korsgaard
