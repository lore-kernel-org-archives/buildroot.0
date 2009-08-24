From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Mon, 24 Aug 2009 10:09:15 +0200
Subject: [Buildroot] buildroot working config file
In-Reply-To: <BAY136-W27E8A1A33F6DD5C0C0FBE4CEF90@phx.gbl>
References: <BAY136-W27E8A1A33F6DD5C0C0FBE4CEF90@phx.gbl>
Message-ID: <5f2b60908240109gac0bc88oafad6f71261d71eb@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

First, _use the buildroot mailing list_. Second, you are replying to an
email that I've already answered, but now in a _new thread_. Please keep
related questions in one thread.

2009/8/24 Raed Abu-Sanad <raedbenz@hotmail.com>:
> Hi,,
>
> I keep getting errors every time i build and compile the build root for
> i386.

Try posting your build log.

> Can you plz, for now, give me a config File for build root with basic
> operations and configurations that could run on a i386 PC (P4).

I have not used Buildroot for i386 targets so I cannot give you a working
config for that. Have you tried 'make defconfig'?

>
> Thanks
> raed
>
> ________________________________
> From: raedbenz at hotmail.com
> To: bjorn.forsman at gmail.com
> Subject: Building Linux system - Beginner?
> Date: Thu, 13 Aug 2009 21:08:52 +0100
>
> Hi,,
> I found your email in the mailing list, and you seemed to me quite
> experienced in buidlroot, I have decided to send you my inquiry, and i would
> be thankful if you reply me back.
> i have put my questions before on the mailing list but no response yet.
>
> What i have done so far is:
> I managed to build the root filesystem "rootfs.i686.ext2" and kernel
> bzImage.
> My questionsd are:
>
> 1- how do use this format of filesystem "rootfs.i686.ext2" ??? usually what
> i know the rootfs consists of multiple directories or an archive and you
> untar it to your target device, e.g. USB flash or HDD partition and you get
> the directories..
>
> 2- I also enabled grub in the filesystem section of the buildroot
> configuration (when i ussued make menuconfig) in the beginning. how can i
> use this grub to install a bootloader in a? USB?
> what i want to do is to put the rootfs and kernel with GRUB bootloader to
> CF/USB flash and run linux.
> How can i do that?
>
> again, I would be thankful if you could reply me.
>
> Thanks
> ________________________________
> Windows Live Messenger: Celebrate 10 amazing years with free winks and
> emoticons. Get Them Now
> ________________________________
> Internet Explorer 8 - accelerate your Hotmail. Download Internet Explorer 8
