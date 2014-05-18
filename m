From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 18 May 2014 19:07:44 +0200
Subject: [Buildroot] [PATCH v8 21/28] xbmc: Add X.org/OpenGL support
In-Reply-To: <g35n4bxjvb.ln2@ID-313208.user.individual.net>
References: <1400342276-10303-1-git-send-email-bernd.kuhls@t-online.de>
 <1400342276-10303-22-git-send-email-bernd.kuhls@t-online.de>
 <20140517205500.GL3459@free.fr>
 <0sjm4bxrs4.ln2@ID-313208.user.individual.net>
 <20140518162900.GA3631@free.fr>
 <g35n4bxjvb.ln2@ID-313208.user.individual.net>
Message-ID: <20140518170744.GB3631@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-05-18 18:52 +0200, Bernd Kuhls spake thusly:
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote in
> news:20140518162900.GA3631 at free.fr: 
> 
> >     comment "xbmc needs an OpenGL backend"
> >         depends on BR2_i386 || BR2_x86_64
> >         depends on !BR2_PACKAGE_HAS_LIBGL
> 
> Hi,
> 
> BR2_i386 || BR2_x86_64 both support libgl and egl/gles, so I typed this:
> 
> comment "xbmc needs an OpenGL backend"

    comment "xbmc needs an OpenGL backend, or an openGL ES and EGL backend"

>        depends on BR2_i386 || BR2_x86_64
>        depends on !BR2_PACKAGE_HAS_LIBGL && !(BR2_PACKAGE_HAS_LIBEGL && BR2
> _PACKAGE_HAS_LIBGLES)
> 
> which seems to do the trick.

Yep, good. :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
