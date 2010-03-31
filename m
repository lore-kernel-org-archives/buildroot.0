From: Sasha Sirotkin <buildroot@browserseal.com>
Date: Wed, 31 Mar 2010 21:28:29 +0300
Subject: [Buildroot] init segfaults when compiled with glibc
In-Reply-To: <87mxxo8ipp.fsf@macbook.be.48ers.dk>
References: <4BB20A06.1090407@browserseal.com>
	<4BB2794A.3030400@free.fr>	<j2i478c82f01003310718gbaf125f7t382a3dd8ac5b3823@mail.gmail.com>	<hovmml$391$1@dough.gmane.org>	<x2g478c82f01003310848x8e42f326v263e14193e0972a6@mail.gmail.com>
	<87mxxo8ipp.fsf@macbook.be.48ers.dk>
Message-ID: <4BB3944D.2080301@browserseal.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard wrote:
>>>>>> "Alexander" == Alexander (Sasha) Sirotkin <buildroot@browserseal.com> writes:
>>>>>>             
>
>  Alexander> I did not manage to compile crosstoll-ng with eglibc yet. It
>  Alexander> looks like eglibc support is broken in crosstool-ng and
>  Alexander> glibc support is broken in buildroot.
>
> uClibc? We don't have glibc support (except for external toolchains), so
> it cannot really be broken ;)
>
>   
Well... it is broken in a sense that buildroot does not work with an 
external toolchain based on glibc. Please see above.
