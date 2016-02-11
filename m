From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Thu, 11 Feb 2016 11:46:48 -0300
Subject: [Buildroot] Setting RGB
In-Reply-To: <1455199443701-125560.post@n4.nabble.com>
References: <CAKvcKqdfjtx96fk=cjMze7sOeY59OfWy1NZ2c_LY8TsuZ29DMA@mail.gmail.com>
 <20160204205505.5a842de4@gmx.net>
 <1455126039107-125494.post@n4.nabble.com>
 <CAAEAJfBS36gKR3P_-MZ888yMi4y=piVN=x77F07z0-+=Bpxv0Q@mail.gmail.com>
 <1455199443701-125560.post@n4.nabble.com>
Message-ID: <CAAEAJfDx=uAYicOmVob-K8LOuYVC6gFaVzzrztJiMnEjVkjnQA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11 February 2016 at 11:04, GabrielCastillo
<gcastillo@controlnet.com.ar> wrote:
> As you told me, i run fb-test and i can see the Image that you show. So i
> assume that the display is mounted well, and the Filesystem, the kernel
> linux, etc, etc is all ok.
>
> So it's rigth to say that the problem is QT5? My App only show a image:
> https://i.ytimg.com/vi/bF-yfKaZUy0/hqdefault.jpg
> But the fizz color are wrong...
>
> May i forget to enable some QT5 option on buildroot?
>

Hm.. that's quite unusual :-) Maybe you can start by drawing colored
rectangles in the Qt app. If the colors look OK, you could blame the
image decoder ?

-- 
Ezequiel Garc?a, VanguardiaSur
www.vanguardiasur.com.ar
