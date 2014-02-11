From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 11 Feb 2014 22:11:15 +0100
Subject: [Buildroot] [PATCH] trivial: update buildroot e-mail address to
 buildroot@buildroot.org
In-Reply-To: <5dc9b6320a27725abc62.1392150183@argentina>
References: <5dc9b6320a27725abc62.1392150183@argentina>
Message-ID: <20140211211115.GC3411@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-02-11 21:23 +0100, Thomas De Schampheleire spake thusly:
> As the e-mail address buildroot at buildroot.org is now enabled, update the
> e-mail addresses in the source tree from @uclibc.org and @busybox.net to our
> own proper domain.

Woohoo! :-)

> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> 
> ---
>  Makefile                                                 |  2 +-
>  docs/README                                              |  2 +-
>  docs/copyright.txt                                       |  2 +-
>  docs/footer.html                                         |  2 +-
>  docs/manual/contribute.txt                               |  2 +-
>  package/x11r7/xserver_xorg-server/xserver_xorg-server.mk |  2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> --- a/Makefile
> +++ b/Makefile
> @@ -1,7 +1,7 @@
>  # Makefile for buildroot
>  #
>  # Copyright (C) 1999-2005 by Erik Andersen <andersen@codepoet.org>
> -# Copyright (C) 2006-2014 by the Buildroot developers <buildroot@uclibc.org>
> +# Copyright (C) 2006-2014 by the Buildroot developers <buildroot@buildroot.org>

I'd keep the original line, since it was the email adress at that time,
and would add a new line:
    # Copyright (C) 2006-2014 by the Buildroot developers <buildroot@uclibc.org>
    # Copyright (C) 2014 by the Buildroot developers <buildroot@buildroot.org>

> diff --git a/docs/copyright.txt b/docs/copyright.txt
> --- a/docs/copyright.txt
> +++ b/docs/copyright.txt

I read that file for the first time tonight. It is hilarious! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
