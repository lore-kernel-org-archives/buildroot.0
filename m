From: Charles Martel <SingerIsland@gmx.com>
Date: Mon, 22 Nov 2010 10:28:40 -0500
Subject: [Buildroot] What is procedure for building custom Linux-2.6.36
 from BuildRoot?
Message-ID: <20101122152841.117090@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks Thomas and Lionel.


----- Original Message -----
From: Thomas Petazzoni
Sent: 11/09/10 12:40 PM
To: buildroot at busybox.net
Subject: Re: [Buildroot] What is procedure for building custom Linux-2.6.36 from BuildRoot?

On Tue, 9 Nov 2010 17:45:40 +0100 Lionel Landwerlin <llandwerlin@gmail.com> wrote: > From the buildroot configuration tool, in the kernel submenu, you can > select a "custom tarball" kernel (which might be a 2.6.36 in your > case) and also a "custom config file". And to adjust the kernel configuration, you can do: make linux26-menuconfig or make linux26-xconfig Regards, Thomas -- Thomas Petazzoni, Free Electrons Kernel, drivers, real-time and embedded Linux development, consulting, training and support. http://free-electrons.com _______________________________________________ buildroot mailing list buildroot at busybox.net http://lists.busybox.net/mailman/listinfo/buildroot
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101122/e1d7199f/attachment.html>
