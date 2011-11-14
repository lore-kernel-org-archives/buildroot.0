From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Mon, 14 Nov 2011 08:30:50 +0100
Subject: [Buildroot] compile under buildroot
In-Reply-To: <B4FA196829E44A5AB99055A1E2166936@ch3mikPC>
References: <B4FA196829E44A5AB99055A1E2166936@ch3mikPC>
Message-ID: <CAAXf6LXQ3aVY2iEqfmD8E4AH-kiKJJXBFJa6Q9reYngSZ=_OjA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

2011/11/13 Jaroslav Jir?sek <jirasek@sauron.cz>:
> Hi, I build buildroot with all development tools, under CentOS 6.
> Buildroot I unpack and chroot to this.
>
> Now I want compile something (for example busybox)
> All attemps ends with this error:
>
> In file included from /usr/include/sys/types.h:27,
> ???????????????? from scripts/basic/fixdep.c:105:
> /usr/lib/gcc/x86_64-unknown-linux-uclibc/4.3.6/include-fixed/features.h:361:23:
> error: gnu/stubs.h: No such file or directory

Just taking a stab at it, but did you enable BR2_HAVE_DEVFILES ? It's
under 'Build options, "development files in target filesystem".

>
> How can I solve this?
>
> Thank you Jarda

Best regards,
Thomas
