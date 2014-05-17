From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Sat, 17 May 2014 23:01:51 +0200
Subject: [Buildroot] [PATCH v8 21/28] xbmc: Add X.org/OpenGL support
References: <1400342276-10303-1-git-send-email-bernd.kuhls@t-online.de>
 <1400342276-10303-22-git-send-email-bernd.kuhls@t-online.de>
 <20140517205500.GL3459@free.fr>
Message-ID: <vavk4bx9g4.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"Yann E. MORIN" <yann.morin.1998@free.fr> wrote in
news:20140517205500.GL3459 at free.fr: 

> Also, I doubt the GL dependency is tied to x86, or the EGL/GLES
> dependency is tied to ARM. What if an ARM platform has a full openGL
> implementation? Probably XBMC would be able to use that, no?

Hi,

xbmc depends on GLES on ARM:
https://github.com/xbmc/xbmc/blob/Gotham/configure.in#L695

I consider this patch as one of the most complicated ones regarding Kconfig, 
for which I am really not an expert ;) I will have a look at the rest of your 
comment tomorrow.

Regards, Bernd
