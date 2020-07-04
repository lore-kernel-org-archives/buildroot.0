From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 5 Jul 2020 02:23:58 +0900
Subject: [Buildroot] [PATCH] qemu_aarch64_virt: bump to Linux 5.7.7
In-Reply-To: <9d073d28-f4ff-24e4-1139-85adf1159112@gmail.com>
References: <20200704142656.1587689-1-masahiroy@kernel.org>
 <9d073d28-f4ff-24e4-1139-85adf1159112@gmail.com>
Message-ID: <CAK7LNARrhQvkgOrmo2bRL3bMczumw0H2TQgAd8P7j4=duiCcPA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jul 5, 2020 at 12:51 AM Romain Naour <romain.naour@gmail.com> wrote:
>
> Hi Masahiro,
>
> Le 04/07/2020 ? 16:26, Masahiro Yamada a ?crit :
> > The latest Linux version works.
>
> We are using the same kernel LTS version 5.4.x for all defconfig for Qemu, we
> want to keep them in sync.
>
> What is the motivation to make this update to the kernel 5.7 ?


Not much.

I just used the latest kernel version for my test.


I was testing -bios boot
(TF-A -> edk2 -> kernel)


The current doc in TF-A refers v5.5
https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git/tree/docs/plat/qemu.rst#n17

Re-using output/images/Image from Buildroot
causes slight version rollback (v5.5 -> v5.4.42).
That is the only reason I just wanted to advance the
version number.

v5.4.42 also works for me.



--
Best Regards
Masahiro Yamada
