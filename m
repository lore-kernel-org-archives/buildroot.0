From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 23 Jun 2014 19:35:44 +0200
Subject: [Buildroot] [PATCH] package/perl-mojolicious: bump to 5.08
In-Reply-To: <CAB0FRstxBpfBcoyojk3j_fPhJdaVfRz2gOZXWdiCGdBviF16TQ@mail.gmail.com>
References: <1403471757-19622-1-git-send-email-yann.morin.1998@free.fr>
 <CAB0FRstxBpfBcoyojk3j_fPhJdaVfRz2gOZXWdiCGdBviF16TQ@mail.gmail.com>
Message-ID: <20140623173544.GC3400@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fran?ois, All,

On 2014-06-23 19:29 +0200, Fran?ois Perrad spake thusly:
> 2014-06-22 23:15 GMT+02:00 Yann E. MORIN <yann.morin.1998@free.fr>:
> > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> >
> > Since CPAN only ever keeps the latest version for download, CPAN now has
> > only 5.08, so us packaging the 5.07 is causing autobuild failures
> >     http://autobuild.buildroot.net/results/358/358f531f2db90b9bc3b1e4e2158c68d2bf6587fc/
> >
> > Bump to the latest version.
> 
> The author of Mojolicious remove very quickly older versions from
> CPAN. It is not a usual policy.

Ah, OK. Thanks for the clarification.

> So, I think that the best way for this module is to move to Backpan
> site which contains all releases.
> 
> PERL_MOJOLICIOUS_SITE = http://backpan.perl.org/authors/id/S/SR/SRI/

If backpan has all the versions of all modules (including the current
versions), shouldn't we point $(BR2_CPAN_MIRROR) to default to backpan,
then? I'll send a new patch doing so. You can still NAK it when it
arrives. ;-)

Fran?ois, apart from this issue, is the bump still valid?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
