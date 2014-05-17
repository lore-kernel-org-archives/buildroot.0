From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 17 May 2014 23:17:43 +0200
Subject: [Buildroot] [PATCH v8 21/28] xbmc: Add X.org/OpenGL support
In-Reply-To: <vavk4bx9g4.ln2@ID-313208.user.individual.net>
References: <1400342276-10303-1-git-send-email-bernd.kuhls@t-online.de>
 <1400342276-10303-22-git-send-email-bernd.kuhls@t-online.de>
 <20140517205500.GL3459@free.fr>
 <vavk4bx9g4.ln2@ID-313208.user.individual.net>
Message-ID: <20140517211743.GT3459@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-05-17 23:01 +0200, Bernd Kuhls spake thusly:
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote in
> news:20140517205500.GL3459 at free.fr: 
> 
> > Also, I doubt the GL dependency is tied to x86, or the EGL/GLES
> > dependency is tied to ARM. What if an ARM platform has a full openGL
> > implementation? Probably XBMC would be able to use that, no?
> 
> Hi,
> 
> xbmc depends on GLES on ARM:
> https://github.com/xbmc/xbmc/blob/Gotham/configure.in#L695

Ah, it's XBMC ./configure that has this constraint. OK.

> I consider this patch as one of the most complicated ones regarding Kconfig, 
> for which I am really not an expert ;)

OK, we can work on this together. ;-)

> I will have a look at the rest of your 
> comment tomorrow.

Good night, see ya!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
