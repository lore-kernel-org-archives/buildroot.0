From: Leonardo Giordano <lgiordano@controlnet.com.ar>
Date: Mon, 21 Dec 2015 19:19:53 -0300
Subject: [Buildroot] QT5 and EGL display
In-Reply-To: <CAAEAJfCzaBPgDDWwb+B7VmLOuEC5T240KQGuLD4yfyjqNhUvJw@mail.gmail.com>
References: <CAFMv-cxijKErcPy=ZptgjfXskpnUS8LZMW2KSgkeV8novFGB3g@mail.gmail.com>
 <20151221155213.279e62a5@free-electrons.com>
 <CAFMv-cx3j+MKFCfyuQ0nYRLdd64Q-WMD_L_Vbv_arMepbP8Ozw@mail.gmail.com>
 <CAAEAJfBzKs8T1rhZQ_p++GEUPGyoXp1NN_eUfbLrOjRRBF2FnQ@mail.gmail.com>
 <CAFMv-czC-gMRuCy1UyAjgZoEB_C8MwsPN=we+ixheNJwT_hJLQ@mail.gmail.com>
 <CAAEAJfCzaBPgDDWwb+B7VmLOuEC5T240KQGuLD4yfyjqNhUvJw@mail.gmail.com>
Message-ID: <CAFMv-cyBViHhuCVkv0Wvtp4NWvsCUUX=4wNciB=h52F1Gi-3_A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ok thanks!

Enviado desde mi m?vil.
Sent from my mobile.
El dic. 21, 2015 7:15 PM, "Ezequiel Garcia" <ezequiel@vanguardiasur.com.ar>
escribi?:

> Leonardo,
>
> On 21 December 2015 at 19:10, Leonardo Giordano
> <lgiordano@controlnet.com.ar> wrote:
> > Thanks for replying.
> > Today we enabled linuxfb, and as we are using DRM, according to atmel
> > website, we had to enable a fb legacy emulation. It seems to work, but
> I'm
> > not sure if this is the best approach.
>
> Well, as far as I can know, it's the only sane option as there's no
> Qt5 platform plugin that can interface into DRM.
> It's a quite popular combination to develop simple UIs (we're using
> that here for the UI of an industrial equipment).
> --
> Ezequiel Garc?a, VanguardiaSur
> www.vanguardiasur.com.ar
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151221/3e4b8e77/attachment-0001.html>
