From: Ron Eggler <reggler@semiosbio.com>
Date: Thu, 17 May 2012 13:35:46 -0700
Subject: [Buildroot] cp210x needed
In-Reply-To: <20120517222149.3c657ce1@skate>
References: <CAFC29aV9nhzG8_ZAG8j1QCGqY_Qv1tg39sGac-5sTUvQL=uRJw@mail.gmail.com>
 <20120517222149.3c657ce1@skate>
Message-ID: <CAFC29aX+g8jJXvp=hMXuXX7WKLNXGuAQ9KeQFZ4Hdf822MNpfQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,
Right but I haven't been able to find it so I wasn't sure if "make
menuconfig"
is the right way to do it...?

Thanks.
Ron

On Thu, May 17, 2012 at 1:21 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Le Thu, 17 May 2012 13:18:01 -0700,
> Ron Eggler <reggler@semiosbio.com> a ?crit :
>
> > I need the cp210x driver for USB/serial conversion. Does anyone know how
> I
> > can get this into my kernel using buildroot?
>
> make linux-menuconfig
>
> will let you enter the kernel configuration tool, in which you can
> enable the cp210x driver.
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120517/58b12e48/attachment-0001.html>
