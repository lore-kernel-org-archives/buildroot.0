From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 29 Jul 2010 21:10:36 +0200
Subject: [Buildroot] [PATCH 0/3] Add support for uclibc NPTL toolchain.
In-Reply-To: <AANLkTi=OKZZMFPpyiC+4jjnEVtYhmSA4_4Avxd97uZU8@mail.gmail.com>
	(Khem Raj's message of "Thu, 29 Jul 2010 10:02:27 -0700")
References: <1280301099-5930-1-git-send-email-raj.khem@gmail.com>
	<877hkee1vu.fsf@macbook.be.48ers.dk>
	<AANLkTi=OKZZMFPpyiC+4jjnEVtYhmSA4_4Avxd97uZU8@mail.gmail.com>
Message-ID: <87bp9qm7df.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Khem" == Khem Raj <raj.khem@gmail.com> writes:

 Khem> Thx.hmmm thats ok however you still need to make a change to get
 Khem> .29 working which is change the 'headers' target to
 Khem> 'install_headers'

Hmm, no - We only ever special cased 0.9.28 (install_dev vs
install_headers) - Is that what you are referring to?

-- 
Bye, Peter Korsgaard
