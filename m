From: Fatih =?UTF-8?Q?A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
Date: Wed, 18 Sep 2013 14:31:27 +0300
Subject: [Buildroot] [PATCH v2] gpu-viv-bin-mx6q: add pkgconfig files
 for EGL, OpenGLESv2 and OpenVG
In-Reply-To: <8bf55b2e7b82a691d6e61fe3bcb843c2@sysmic.org>
References: <1379502224-4999-1-git-send-email-fatih.asici@gmail.com>
 <8bf55b2e7b82a691d6e61fe3bcb843c2@sysmic.org>
Message-ID: <1379503887.9971.8.camel@viko>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On Wed, 2013-09-18 at 13:20 +0200, J?r?me Pouiller wrote:
> > +Name: egl
> > +Description: Freescale gpu-viv-bin-mx6q implementation of EGL
> > +Version: 1.0
> > +Libs: -L${libdir} -lGAL -lEGL
> > +Cflags: -I${includedir}/ -DEGL_API_FB=1
> IFAIK, -DEGL_API_FB=1 must be used only if GPU_VIV_BIN_MX6Q_LIB_TARGET
> == fb.

I did not know this option. I will send a new patch sed'ing
installed .pc files.

Thanks,
Fatih
