From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 Nov 2014 18:31:10 +0100
Subject: [Buildroot] [PATCH] package/clamav: fix build with uClibc
In-Reply-To: <XnsA3E7BAAD88DC2berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
References: <1416155667-21771-1-git-send-email-yann.morin.1998@free.fr>
 <XnsA3E7BAAD88DC2berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <20141116173110.GC10840@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-11-16 18:21 +0100, Bernd Kuhls spake thusly:
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote in 
> news:1416155667-21771-1-git-send-email-yann.morin.1998 at free.fr:
> 
> > So, just extend the test so that backtrace support is disable on uClibc,
> > unless it has been configured with backtrace support.
> thanks, your patch supersedes http://patchwork.ozlabs.org/patch/406336/

Damn, it seems I should look in our patchwork before fixing bugs. ;-)

Thanks for pointing this out.

> Please add the upstream bugtracker URL to your patch: 
> https://bugzilla.clamav.net/show_bug.cgi?id=11170

OK, I'll add it locally, but hopefully the maintainer can just stick
this URL when he commits. :-p

Regards,
Yann E. MORIN.


-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
