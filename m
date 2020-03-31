From: Belisko Marek <marek.belisko@gmail.com>
Date: Tue, 31 Mar 2020 23:31:48 +0200
Subject: [Buildroot] [PATCH v3] configs/nenopi_neo4: new updated
 defconfig
In-Reply-To: <20200331232357.0a50e3a3@windsurf.home>
References: <1585637518-9836-1-git-send-email-marek.belisko@open-nandra.com>
 <20200331232357.0a50e3a3@windsurf.home>
Message-ID: <CAAfyv363Y9FhVpU-kSG7S=nOxwxS4FRod+=XxLgp86-v2BD-QA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Mar 31, 2020 at 11:24 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Marek,
>
> On Tue, 31 Mar 2020 08:51:58 +0200
> Marek Belisko <marek.belisko@open-nandra.com> wrote:
>
> > This patch revert 8af7b11bd8a95bc41e4de46f727f3b0afde465a4 and
> > add extra options to have build working
> >
> > Updates:
> > - enable BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN
> > - bump kernel to 5.4
> > - increase default rootfs size to 70M
> >
> > Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
>
> Thanks for this new version. I was about to apply, but found something
> important to be improved: could you use the mainline U-Boot instead?
> Most notably, this will allow you to use the idbloader.img target,
> which provides a ready-to-use binary for the first stage bootloader,
> which in turns allows to simplify the post-build script. See the
> configs/roc_pc_rk3399_defconfig configuration for an example of another
> platform using RK3399.
>
> Other minor nits: you should update the DEVELOPERS file to add yourself
> as a maintainer for this defconfig, and if possible update the
> .gitlab-ci.yml file by running "make .gitlab-ci.yml".
>
> Could you work on these improvements and send an updated version?
Sure. I'll post updated in next few days. Thanks for review.
>
> Thanks a lot!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

BR,

marek

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com
