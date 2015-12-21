From: Leonardo Giordano <lgiordano@controlnet.com.ar>
Date: Mon, 21 Dec 2015 19:10:24 -0300
Subject: [Buildroot] QT5 and EGL display
In-Reply-To: <CAAEAJfBzKs8T1rhZQ_p++GEUPGyoXp1NN_eUfbLrOjRRBF2FnQ@mail.gmail.com>
References: <CAFMv-cxijKErcPy=ZptgjfXskpnUS8LZMW2KSgkeV8novFGB3g@mail.gmail.com>
 <20151221155213.279e62a5@free-electrons.com>
 <CAFMv-cx3j+MKFCfyuQ0nYRLdd64Q-WMD_L_Vbv_arMepbP8Ozw@mail.gmail.com>
 <CAAEAJfBzKs8T1rhZQ_p++GEUPGyoXp1NN_eUfbLrOjRRBF2FnQ@mail.gmail.com>
Message-ID: <CAFMv-czC-gMRuCy1UyAjgZoEB_C8MwsPN=we+ixheNJwT_hJLQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for replying.
Today we enabled linuxfb, and as we are using DRM, according to atmel
website, we had to enable a fb legacy emulation. It seems to work, but I'm
not sure if this is the best approach.
Thanks for support!
Best regards

Enviado desde mi m?vil.
Sent from my mobile.
El dic. 21, 2015 6:56 PM, "Ezequiel Garcia" <ezequiel@vanguardiasur.com.ar>
escribi?:

> Hi Leonardo,
>
> On 21 December 2015 at 12:14, Leonardo Giordano
> <lgiordano@controlnet.com.ar> wrote:
> > Thanks Thomas for replying. So glad to have an email from you (I have
> been
> > reading lots of info you published).
> >
> > EGL is enabled at mesa3d. Compilation failed but I proceed according to:
> > http://lists.busybox.net/pipermail/buildroot/2014-June/100044.html
> > and its reply:
> > http://lists.busybox.net/pipermail/buildroot/2014-June/100045.html
> >
> > Anyway, which would be the best approach for using QT5 on an Atmel board
> (no
> > gpu) in your opinion? The applications we usually do, just need a simple
> > interface (I mean we don't do games or multimedia apps).
> >
>
> To build a simple 2D UI, you should be able to use the linuxfb Qt5
> platform, instead of the eglfs platform.
> --
> Ezequiel Garc?a, VanguardiaSur
> www.vanguardiasur.com.ar
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151221/ed421d7f/attachment.html>
