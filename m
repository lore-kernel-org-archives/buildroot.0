From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 15 Aug 2018 18:23:07 +0200
Subject: [Buildroot] [PATCH 17/17] perl-termreadkey: new package
In-Reply-To: <CALURroQQrDa5m5=0BVYaW1zr2hEK9dNvoihqoQG1Om2adZhw6A@mail.gmail.com>
References: <20180811182749.20924-1-chrismcc@gmail.com>
 <20180811182749.20924-18-chrismcc@gmail.com>
 <20180813235716.070f77f0@windsurf> <20180814155337.GM7915@scaer>
 <CALURroQQrDa5m5=0BVYaW1zr2hEK9dNvoihqoQG1Om2adZhw6A@mail.gmail.com>
Message-ID: <20180815162307.GD2556@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Chrsitopher, All,

On 2018-08-15 04:24 -0700, Christopher McCrory spake thusly:
> On Tue, Aug 14, 2018 at 8:53 AM, Yann E. MORIN < [1]yann.morin.1998@free.fr> wrote:
>   On 2018-08-13 23:57 +0200, Thomas Petazzoni spake thusly:
>   > Adding Yann and Arnout, licensing question below.
>   > On Sat, 11 Aug 2018 11:27:49 -0700, Christopher McCrory wrote:
>   > > +PERL_TERMREADKEY_VERSION = 2.37
>   > > +PERL_TERMREADKEY_SOURCE = TermReadKey-$(PERL_ TERMREADKEY_VERSION).tar.gz
>   > > +PERL_TERMREADKEY_SITE = $(BR2_CPAN_MIRROR)/authors/id/ J/JS/JSTOWE
>   > > +PERL_TERMREADKEY_LICENSE = Artistic or GPL-1.0+
>   >
>   > This is not correct I believe.
> 
>   IANAL...
> 
>   Indeed it's not.
> 
> The current maintainer explains it here:
> [2]https://github.com/jonathanstowe/TermReadKey/issues/11

So the watters are even muddier than what I expected. We can't take a
position here. The best we can state then is:

    PERL_TERMREADKEY_LICENSE = TERM::Readkey license

Anything else could be misleading.

If a user has any concern with that license, they'd have to consult with
the legal department in their organisation.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
