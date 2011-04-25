From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 25 Apr 2011 20:06:39 +0200
Subject: [Buildroot] JFFS2 Question
In-Reply-To: <BANLkTik4X6F=W6JCAcazhYx=9+GoguWawg@mail.gmail.com> (Charles
	Krinke's message of "Sun, 24 Apr 2011 20:15:20 -0700")
References: <BANLkTi=WFMS9Uv-x6H8iHO-vDFwRvdS2hA@mail.gmail.com>
	<87fwp78giq.fsf@macbook.be.48ers.dk>
	<BANLkTik4X6F=W6JCAcazhYx=9+GoguWawg@mail.gmail.com>
Message-ID: <877hai8ats.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Charles" == Charles Krinke <charles.krinke@gmail.com> writes:

 Charles> I believe the sector size is correct but I am suspecting that
 Charles> the original Freescale engineer that created the 8323 support
 Charles> did not complete the nor flash. Meaning I think it is probably
 Charles> locked.

 Charles> You woldn't know off hand which file an unlocking subroutine
 Charles> should go into, would you?

I think the easiest is just to do a 'protect off all' in u-boot.

-- 
Bye, Peter Korsgaard
