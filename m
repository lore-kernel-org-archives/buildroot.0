From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Mon, 21 Dec 2015 18:56:06 -0300
Subject: [Buildroot] QT5 and EGL display
In-Reply-To: <CAFMv-cx3j+MKFCfyuQ0nYRLdd64Q-WMD_L_Vbv_arMepbP8Ozw@mail.gmail.com>
References: <CAFMv-cxijKErcPy=ZptgjfXskpnUS8LZMW2KSgkeV8novFGB3g@mail.gmail.com>
 <20151221155213.279e62a5@free-electrons.com>
 <CAFMv-cx3j+MKFCfyuQ0nYRLdd64Q-WMD_L_Vbv_arMepbP8Ozw@mail.gmail.com>
Message-ID: <CAAEAJfBzKs8T1rhZQ_p++GEUPGyoXp1NN_eUfbLrOjRRBF2FnQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Leonardo,

On 21 December 2015 at 12:14, Leonardo Giordano
<lgiordano@controlnet.com.ar> wrote:
> Thanks Thomas for replying. So glad to have an email from you (I have been
> reading lots of info you published).
>
> EGL is enabled at mesa3d. Compilation failed but I proceed according to:
> http://lists.busybox.net/pipermail/buildroot/2014-June/100044.html
> and its reply:
> http://lists.busybox.net/pipermail/buildroot/2014-June/100045.html
>
> Anyway, which would be the best approach for using QT5 on an Atmel board (no
> gpu) in your opinion? The applications we usually do, just need a simple
> interface (I mean we don't do games or multimedia apps).
>

To build a simple 2D UI, you should be able to use the linuxfb Qt5
platform, instead of the eglfs platform.
-- 
Ezequiel Garc?a, VanguardiaSur
www.vanguardiasur.com.ar
