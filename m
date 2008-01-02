From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Wed, 2 Jan 2008 14:51:05 +0200 (EET)
Subject: [Buildroot] [patch] to use DISABLE_IPV6 instead of fix seting
In-Reply-To: <477A4461.70205@arcormail.de>
References: <477A4461.70205@arcormail.de>
Message-ID: <56806.127.0.0.1.1199278265.squirrel@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Claus,

> while working on a new rootfile system with ipv6 support, I had problems
> with some packages.
> By the way there was an  too error in the libxml2 makefile when
> installing the target-header.
>
> Is it documented how makefiles should be written to be flexible for
> differrent toolchain options like:
>
> libintl,
> largefile,
> ipv6,

Seems very few of packages honor these toolchain options. As I know, for example, Mplayer requires
largefile support. Many people are using only single toolchain and not testing with other toolchain options.
Thanks for patch - will apply soon.

regards,
Ivan
