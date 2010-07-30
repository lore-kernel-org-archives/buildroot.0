From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 29 Jul 2010 19:12:39 -0700
Subject: [Buildroot] [PATCH 0/3] Add support for uclibc NPTL toolchain.
In-Reply-To: <87bp9qm7df.fsf@macbook.be.48ers.dk>
References: <1280301099-5930-1-git-send-email-raj.khem@gmail.com> 
	<877hkee1vu.fsf@macbook.be.48ers.dk>
	<AANLkTi=OKZZMFPpyiC+4jjnEVtYhmSA4_4Avxd97uZU8@mail.gmail.com> 
	<87bp9qm7df.fsf@macbook.be.48ers.dk>
Message-ID: <AANLkTikoL=ctDvXU8i4T1bW0__3QcSm0nAq+4YrKphUg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jul 29, 2010 at 12:10 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Khem" == Khem Raj <raj.khem@gmail.com> writes:
>
> ?Khem> Thx.hmmm thats ok however you still need to make a change to get
> ?Khem> .29 working which is change the 'headers' target to
> ?Khem> 'install_headers'
>
> Hmm, no - We only ever special cased 0.9.28 (install_dev vs
> install_headers) - Is that what you are referring to?
>

no. I was referring to something which you already have in the patch
so we are good.
I was referring to having install_headers in target instead of headers
as I had in my patch earlier
which would not have worked with .29

> --
> Bye, Peter Korsgaard
>
