From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 02 Feb 2012 23:26:52 +0100
Subject: [Buildroot] [RFC] python bindings handling
In-Reply-To: <20120202232455.03a07aaa@skate> (Thomas Petazzoni's message of
 "Thu, 2 Feb 2012 23:24:55 +0100")
References: <CAGm1_ksToKWTwgAjys49Nop66WwLSdMi7ztC3Zc=g6QHE-7WbQ@mail.gmail.com>
 <20120127165334.6d1dd39b@skate> <878vkk9auh.fsf@macbook.be.48ers.dk>
 <20120202232455.03a07aaa@skate>
Message-ID: <87vcno7txv.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Ah, then I think I misunderstood. I think those Python bindings were a
 Thomas> *separate* package from the C/C++ library for which the binding is
 Thomas> designed, i.e that you had two packages:

 Thomas> 	libfoo
 Thomas> 	python-libfoo

 Thomas> In which case I think python-libfoo (which is a separate package)
 Thomas> should go in the Python section.

Yes, if it is a seperate package upstream, then I agree.

 Thomas> In the other case (i.e, the binding is directly an option in
 Thomas> the C/C++ library itself and both are a single package in terms
 Thomas> of upstream source), then yeah, option 1/ would probably be
 Thomas> good.

Great!

-- 
Bye, Peter Korsgaard
