From: Charles Krinke <charles.krinke@gmail.com>
Date: Sat, 3 Dec 2011 11:15:08 -0800
Subject: [Buildroot] USB FAT drive in Linux on MPC8321
In-Reply-To: <20111203092854.3301cf7f@skate>
References: <CALo-6+i-OXWXHxpmsH4tab9RBhT5qoWOcpSbfR84nbt9GaAn4Q@mail.gmail.com>
 <20111203092854.3301cf7f@skate>
Message-ID: <CALo-6+hZ-A8=+HosZJhjW3xGaXp7a_y3T6vdH2wu6c5TMuQ1og@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas:

In doing a bit googling last night, I found mention of a usb mount point
being of either type "msdos" or "vfat" and it is entirely possible this
might be the case.

I dont have the target with me at home this weekend, but having a mount
point that is 8.3 centric is at least possible.

If you dont mind, I'll do a bit more research next week as I dont want to
cause any unnecessary effort. As always, I treasure your technically
focused advice as we get this project throuh some qualification testing.

Charles
On Dec 3, 2011 12:29 AM, "Thomas Petazzoni" <
thomas.petazzoni@free-electrons.com> wrote:

> Hello Charles,
>
> Le Fri, 2 Dec 2011 14:37:17 -0800,
> Charles Krinke <charles.krinke@gmail.com> a ?crit :
>
> > To illustrate, here is an ls from my debian laptop followed by an ls
> > of the same USB drive from the MPC8321 target illustrating the issues.
>
> Presumably your kernel has CONFIG_FAT_FS enabled, but not
> CONFIG_VFAT_FS enabled. The latter is the one that enables long file
> name support.
>
> Can you provide your kernel .config and give details on your kernel
> version (vanilla version, version modified by an hardware vendor,
> etc.) ?
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111203/9e1bc398/attachment.html>
