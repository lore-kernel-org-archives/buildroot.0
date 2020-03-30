From: Belisko Marek <marek.belisko@gmail.com>
Date: Mon, 30 Mar 2020 18:38:04 +0200
Subject: [Buildroot] [PATCH 2/2] nanpi_neo4_config: Enable
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN optiony
In-Reply-To: <20200330152507.GA518052@curiosity>
References: <1585574086-28047-1-git-send-email-marek.belisko@open-nandra.com>
 <1585574086-28047-2-git-send-email-marek.belisko@open-nandra.com>
 <20200330152507.GA518052@curiosity>
Message-ID: <CAAfyv37yeZ_EcL8Pa1PURLcaXUvwGDv5jKLJEJ8WeHhvqbhuag@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Mar 30, 2020 at 5:20 PM Sergey Matyukevich <geomatsi@gmail.com> wrote:
>
> > Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
> > ---
> >  configs/nanopi_neo4_defconfig | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/configs/nanopi_neo4_defconfig b/configs/nanopi_neo4_defconfig
> > index 0e58aea..2bffe66 100644
> > --- a/configs/nanopi_neo4_defconfig
> > +++ b/configs/nanopi_neo4_defconfig
> > @@ -11,6 +11,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
> >  BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/ARM-software/arm-trusted-firmware"
> >  BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v2.0"
> >  BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="rk3399"
> > +BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN=y
> >  BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
>
> I would suggest to write proper commit messages for these two patches.
OK fine. I have in queue also patch for bumping kernel to 5.4 will
test and post updated version. Thanks.
>
> Otherwise neo4 build looks good:
> Tested-by: Sergey Matyukevich <geomatsi@gmail.com>
>
> Regards,
> Sergey

BR,

marek
