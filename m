From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 Oct 2014 00:46:30 +0200
Subject: [Buildroot] [PATCH v3 2/3] gst-ffmpeg: add --pkg-config to
 internal libav configure options
In-Reply-To: <XnsA3C9F0AB8CD30berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
References: <1413142206-30581-1-git-send-email-danomimanchego123@gmail.com>
 <1413142206-30581-2-git-send-email-danomimanchego123@gmail.com>
 <20141017212453.GI3971@free.fr>
 <XnsA3C9F0AB8CD30berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <20141017224630.GE7944@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-10-17 23:39 +0200, Bernd Kuhls spake thusly:
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote in 
> news:20141017212453.GI3971 at free.fr:
> 
> > Instead of fixing just that one package, shouldn't we provide a symlink:
> >     TUPLE-pkg-config  ->  pkg-config
> > 
> > This way, all packages that expect a cross-pkg-config will work without
> > customisation.
> > 
> > Thomas, thoughts?
> 
> Hi,
> 
> I had the same idea back in January, but Thomas did not like it ;)
> http://patchwork.ozlabs.org/patch/312273/

Damned! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
