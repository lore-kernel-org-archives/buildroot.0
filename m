From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 29 Jul 2010 10:02:27 -0700
Subject: [Buildroot] [PATCH 0/3] Add support for uclibc NPTL toolchain.
In-Reply-To: <877hkee1vu.fsf@macbook.be.48ers.dk>
References: <1280301099-5930-1-git-send-email-raj.khem@gmail.com> 
	<877hkee1vu.fsf@macbook.be.48ers.dk>
Message-ID: <AANLkTi=OKZZMFPpyiC+4jjnEVtYhmSA4_4Avxd97uZU8@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jul 29, 2010 at 8:36 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Khem" == Khem Raj <raj.khem@gmail.com> writes:
>
> ?Khem> Hi
> ?Khem> The following set of patches is a revised list of nptl build
> ?Khem> sequence support in BR internal toolchain.
>
> Thanks, committed. I decided to simply drop the old 0.9.28.3 version
> instead of applying patch 2 though.

Thx.hmmm thats ok however you still need to make a change to get .29 working
which is change the 'headers' target to 'install_headers'

-Khem

>
> --
> Bye, Peter Korsgaard
>
