From: Michael Walle <michael@walle.cc>
Date: Sun, 10 May 2020 15:55:51 +0200
Subject: [Buildroot] [PATCH] board: Add Kontron SMARC-sAL28 support
In-Reply-To: <20200510133106.25067-1-michael@walle.cc>
References: <20200510133106.25067-1-michael@walle.cc>
Message-ID: <32a5327b4bfbe4f797c77215e5f8800e@walle.cc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 2020-05-10 15:31, schrieb Michael Walle:
> From: Michael Walle <michael.walle@kontron.com>
> 
> Now that upstream supports this board add buildroot support for it, 
> too.
> 
> This supports:
>  - upstream linux kernel, 5.7-rc4 for now. Once 5.7 is released and
>    buildroot will switch to this kernel
>      BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>    can be removed.
>  - building an image which can be installed to eMMC or SD card.
>  - upstream u-boot patches are pending, therefore no support for
>    building a bootloader for now.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  DEVELOPERS                               |  2 ++
>  board/kontron/smarc-sal28/boot.cmd       |  8 ++++++++
>  board/kontron/smarc-sal28/genimage.cfg   | 10 ++++++++++
>  board/kontron/smarc-sal28/linux.fragment | 14 ++++++++++++++
>  board/kontron/smarc-sal28/post-build.sh  |  9 +++++++++
>  configs/kontron_smarc_sal28_defconfig    | 18 ++++++++++++++++++

A board readme is missing, I'll add that in the next patch version.
But for now, I'm waiting for further feedback.

-michael
