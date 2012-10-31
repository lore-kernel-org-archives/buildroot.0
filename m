From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 31 Oct 2012 23:43:22 +0100
Subject: [Buildroot] Build gcc debugger for the Target
In-Reply-To: <CABtOAfxuz7Hn+05yeTgGZTExttKFk_w31Pot3e-YSvx+weVpnw@mail.gmail.com>
References: <CABtOAfxuz7Hn+05yeTgGZTExttKFk_w31Pot3e-YSvx+weVpnw@mail.gmail.com>
Message-ID: <CAHXCMM+aZH-FaqQ62CF=oapVK5zGPnbkEUNpUsHBvgY2Z_Dy0A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alexander,

2012/10/31 Alexander Khryukin <alexander@mezon.ru>
>
> Hello.
> How i can build and package gcc for taget image?
> Looks i need option like "Build gdb debugger for the Target"
> but for gcc.
To enable gcc package on the target you need the enable "Development
files inthe target FS" under the "Build options" menu, then gcc
package will be available in the "Package Selection >> Development
tools" submenu.

>
> Now my image compiles fine, but without gcc on target it
>  worthless

Note that gcc on the target is not really tested, so it may not build or work...


Regards,

--
Sam
