From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 Nov 2014 16:57:31 +0100
Subject: [Buildroot] [PATCH] package/sdl_sound: do not enable -Werror,
 even in debug mode
In-Reply-To: <XnsA3E7AB46367CBberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
References: <1416152347-760-1-git-send-email-yann.morin.1998@free.fr>
 <XnsA3E7AB46367CBberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <20141116155731.GA10840@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-11-16 16:50 +0100, Bernd Kuhls spake thusly:
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote in 
> news:1416152347-760-1-git-send-email-yann.morin.1998 at free.fr:
> 
> > Add a patch to remove -Werror from configure.in.
> 
> a similar patch was rejected by Peter: 
> http://patchwork.ozlabs.org/patch/400969/

Damned... :-(

Thanks for pointing out, I'll mark my patch Rejected in Patchwork (but
will keep it locally, so I remember to fix this issue).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
