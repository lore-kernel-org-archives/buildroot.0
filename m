From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 23 Nov 2015 18:58:17 +0100
Subject: [Buildroot] [PATCH 06/51] package/perl: include perl-cross in
 the legal-info output
In-Reply-To: <56534BFA.8060203@lucaceresoli.net>
References: <cover.1448289515.git.yann.morin.1998@free.fr>
 <f360919da5180e26ce4f96eefed14c29b526b428.1448289515.git.yann.morin.1998@free.fr>
 <56534BFA.8060203@lucaceresoli.net>
Message-ID: <20151123175817.GH3857@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Luca, All,

On 2015-11-23 18:25 +0100, Luca Ceresoli spake thusly:
> Yann E. MORIN wrote:
> >The perl-cross sources are combined with the perl sources, so they must
> >be redistributed for proper compliance.
> >
> >Add a post-legal-info hook that also installs them in the legal-info
> >output.
> >
> >Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> >Cc: Luca Ceresoli <luca@lucaceresoli.net>
> >Cc: Francois Perrad <fperrad@gmail.com>
> 
> Ouch:
> 
> $ make legal-info
> [...]
> mkdir: missing operand
> Try 'mkdir --help' for more information.
> make[1]: *** [perl-legal-info] Error 1
> make: *** [_all] Error 2
> 
> This probably needs patch 10.

Damned. That should teach me to re-organise so-big a series *after*
testing it... :-/

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
