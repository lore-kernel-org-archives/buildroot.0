From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 11 Jul 2010 20:52:26 +0200
Subject: [Buildroot] init: I won't write compressed data to a terminal.
In-Reply-To: <4C377CB2.4080905@gmx.net> (Ossy's message of "Fri, 09 Jul 2010
	21:46:58 +0200")
References: <4C33AB4E.9050604@gmx.net>
	<AANLkTimdJ34gAH-YTjfOkW_iEsKZyRvBVnbLIS55oMdd@mail.gmail.com>
	<4C34E18F.4080109@gmx.net> <87aaq358x1.fsf@macbook.be.48ers.dk>
	<4C34E693.9040307@gmx.net> <871vbf585n.fsf@macbook.be.48ers.dk>
	<87wrt73ra6.fsf@macbook.be.48ers.dk> <4C377CB2.4080905@gmx.net>
Message-ID: <87tyo56ec5.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ossy" == Ossy  <ossy1980@gmx.net> writes:

 Ossy> Am 07.07.2010 23:39, schrieb Peter Korsgaard:
 >>>>>>> "Peter" == Peter Korsgaard<jacmet@uclibc.org>  writes:
 >> 
 >> Hi,
 >> 
 Peter> No, it's because it's bzip2 instead of busybox.
 >> 
 Peter> I'm doing a test build right now to see what goes wrong.
 >> 
 >> Ok, worked around in git. Could you update your tree and test a CLEAN
 >> rebuild?
 Ossy> It works now. It's the busybox and not the bzip2executable. I only
 Ossy> applied my u-boot patch (@see 07.07.2010 22:55h) which is the only
 Ossy> difference to the current git tree.

Ok, good - Thanks.

-- 
Bye, Peter Korsgaard
