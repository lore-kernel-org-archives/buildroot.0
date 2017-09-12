From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 12 Sep 2017 17:45:21 -0300
Subject: [Buildroot] [PATCH 2/2] uboot-tools: bump to version 2017.09
In-Reply-To: <87vakn656b.fsf@dell.be.48ers.dk>
References: <1505157066-25651-1-git-send-email-festevam@gmail.com>
 <1505157066-25651-2-git-send-email-festevam@gmail.com>
 <87vakn656b.fsf@dell.be.48ers.dk>
Message-ID: <CAOMZO5Cy39dYHhhRA05UgG_T=P98w57RcESzonyTJvpwVH=yeA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Sep 12, 2017 at 5:19 PM, Peter Korsgaard <peter@korsgaard.com> wrote:
>>>>>> "Fabio" == Fabio Estevam <festevam@gmail.com> writes:
>
>  > Signed-off-by: Fabio Estevam <festevam@gmail.com>
>  > ---
>  >  package/uboot-tools/uboot-tools.hash | 2 +-
>  >  package/uboot-tools/uboot-tools.mk   | 2 +-
>  >  2 files changed, 2 insertions(+), 2 deletions(-)
>
>  > diff --git a/package/uboot-tools/uboot-tools.hash b/package/uboot-tools/uboot-tools.hash
>  > index 3ba8e34..82efc79 100644
>  > --- a/package/uboot-tools/uboot-tools.hash
>  > +++ b/package/uboot-tools/uboot-tools.hash
>  > @@ -1,2 +1,2 @@
>  >  # Locally computed:
>  > -sha256  5374bfdc8acb9a38c025371b1ff20f45e7533668e84e685d0df5d9e7c0e4feff  u-boot-2017.07.tar.bz2
>  > +sha256  b2d15f2cf5f72e706025cde73d67247c6da8cd35f7e10891eefe7d9095089744  u-boot-2017.09.tar.bz2
>  > diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
>  > index 4f39f4a..4480005 100644
>  > --- a/package/uboot-tools/uboot-tools.mk
>  > +++ b/package/uboot-tools/uboot-tools.mk
>  > @@ -4,7 +4,7 @@
>  >  #
>  >  ################################################################################
>
>  > -UBOOT_TOOLS_VERSION = 2017.07
>  > +UBOOT_TOOLS_VERSION = 2017.09
>
> This doesn't seem to work here:

Seems to build fine here with a mx53loco_defconfig target:
https://pastebin.com/8tPC6MWN
