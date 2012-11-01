From: Alexander Khryukin <alexander@mezon.ru>
Date: Thu, 1 Nov 2012 13:41:31 +0300
Subject: [Buildroot] Build gcc debugger for the Target
In-Reply-To: <CAHXCMM+aZH-FaqQ62CF=oapVK5zGPnbkEUNpUsHBvgY2Z_Dy0A@mail.gmail.com>
References: <CABtOAfxuz7Hn+05yeTgGZTExttKFk_w31Pot3e-YSvx+weVpnw@mail.gmail.com>
 <CAHXCMM+aZH-FaqQ62CF=oapVK5zGPnbkEUNpUsHBvgY2Z_Dy0A@mail.gmail.com>
Message-ID: <CABtOAfxVfcmYSAa+X6ksTdbVVCq4_piWCyO-L0-JAdAnrq_TSA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/11/1 Samuel Martin <s.martin49@gmail.com>

> Hi Alexander,
>
> 2012/10/31 Alexander Khryukin <alexander@mezon.ru>
> >
> > Hello.
> > How i can build and package gcc for taget image?
> > Looks i need option like "Build gdb debugger for the Target"
> > but for gcc.
> To enable gcc package on the target you need the enable "Development
> files inthe target FS" under the "Build options" menu, then gcc
> package will be available in the "Package Selection >> Development
> tools" submenu.
>
> >
> > Now my image compiles fine, but without gcc on target it
> >  worthless
>
> Note that gcc on the target is not really tested, so it may not build or
> work...
>
>
> Regards,
>
> --
> Sam
>


Yes, i enabled Devel files on target, but gcc not available into
"Development Tools".

Also i using external toolchain, not buildroot.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121101/09f91dbd/attachment-0001.html>
