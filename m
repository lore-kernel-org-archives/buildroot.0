From: Chetan Kumar <shivakumar.chetan@gmail.com>
Date: Wed, 10 Aug 2016 16:05:38 +0100
Subject: [Buildroot] eudev compilation fails on buildroot-2016.08-rc1
In-Reply-To: <CAFN-Ez51T+Z-3t_15sWgPDgrvRYRyW6raiDvbC744cgVcqiJ8w@mail.gmail.com>
References: <CAFN-Ez51T+Z-3t_15sWgPDgrvRYRyW6raiDvbC744cgVcqiJ8w@mail.gmail.com>
Message-ID: <CAFN-Ez4f+J9cgQCRmp+nhAtfZfjwN91mRO-OB-YgBjp_X07JCA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

BTW,

I have used raspberrypi3_defconfig

and I have

BR2_TOOLCHAIN_BUILDROOT_WCHAR=y

Thanks
C



On Wed, Aug 10, 2016 at 3:57 PM, Chetan Kumar <shivakumar.chetan@gmail.com>
wrote:

> Hi,
>
> I am trying to build eudev on buildroot-2016.08-rc1, it fails at below
>
> checking for gawk... (cached) mawk
> checking for /home/buildroot-2016.08-rc1/output/host/usr/bin/arm-
> buildroot-linux-uclibcgnueabihf-gcc option to accept ISO C99...
> unsupported
> configure: error: no C99 compiler found, eudev requires a C99 compiler.
> make[1]: *** [/home//buildroot-2016.08-rc1/output/build/eudev-3.2/.stamp_configured]
> Error 1
> make: *** [_all] Error 2
>
>
> Any help ?
>
> Thanks
> C
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160810/6a991012/attachment.html>
