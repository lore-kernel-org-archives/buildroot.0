From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 5 Dec 2016 10:54:32 +0200
Subject: [Buildroot] [PATCH] raspberrypi-tools: new package
In-Reply-To: <1480926935-3393-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1480926935-3393-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20161205085432.abds6szc7rtxracq@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, Dec 05, 2016 at 09:35:35AM +0100, Thomas Petazzoni wrote:
> This new package currently only installs the "rpiboot" utility, which
> is needed to access via USB mass storage the built-in eMMC of
> Raspberry Pi compute modules. It has been successfully tested on HW by
> Quentin Schulz.
> 
> One annoyance is that this big repository contains a huge amount of
> things, not related to rpiboot, including pre-built toolchains and
> lots of other stuff. But there's not much we can do about it.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Tested-by: Quentin Schulz <quentin.schulz@free-electrons.com>
> ---
>  package/Config.in.host                             |   1 +
>  ...oot-Makefile-allow-passing-CFLAGS-LDFLAGS.patch |  27 +++++
>  ...0002-usbboot-Makefile-add-DESTDIR-support.patch |  48 ++++++++
>  ...n.c-rework-logic-to-find-def1-def2-and-de.patch | 127 +++++++++++++++++++++

Adding a link to your upstream pull request[1] somewhere would be nice.

[1] https://github.com/raspberrypi/tools/pull/70

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
