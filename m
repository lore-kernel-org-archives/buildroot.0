From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 2 Aug 2014 00:18:48 +0200
Subject: [Buildroot] [PATCH v16 1/3] xbmc: Add X.org/OpenGL support
In-Reply-To: <XnsA37D62E96EAberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
References: <1406914359-31106-1-git-send-email-bernd.kuhls@t-online.de>
 <1406914359-31106-2-git-send-email-bernd.kuhls@t-online.de>
 <20140801213036.GE3778@free.fr>
 <XnsA37D62E96EAberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <20140801221848.GH3778@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-08-02 00:02 +0200, Bernd Kuhls spake thusly:
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote in 
> news:20140801213036.GE3778 at free.fr:
> 
> > We currently do not disable rsxs, and XBMC builds just fine on the RPi.
> > However, we remove it from the rootfs as a post-install hook.
> > 
> > What's the problem with rsxs on EGL/GLES?
> 
> according to xbmc configure rsxs depends on opengl only:
> https://github.com/xbmc/xbmc/blob/Gotham/configure.in#L1469
> 
> This can be confirmed when looking the rsxs configure:
> https://github.com/xbmc/xbmc/blob/Gotham/xbmc/screensavers/rsxs-
> 0.9/configure.ac#L97
> 
> I am surprised that rsxs is build at all with egl/gles only.

Well, I said "XBMC builds just fine" and "we remove [rsxs] from the rootfs".

That does not imply that rsxs is built and installed.
/me is just kidding and playing with words and logic, here. ;-)

> My patch just follows the configure system of xbmc.

OK. Thanks for the clarifications. :-)

Regards,
Yann E. MORIN.


-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
