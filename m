From: Belisko Marek <marek.belisko@gmail.com>
Date: Thu, 2 Apr 2020 10:16:09 +0200
Subject: [Buildroot] [PATCH v3] configs/nenopi_neo4: new updated
 defconfig
In-Reply-To: <20200331232357.0a50e3a3@windsurf.home>
References: <1585637518-9836-1-git-send-email-marek.belisko@open-nandra.com>
 <20200331232357.0a50e3a3@windsurf.home>
Message-ID: <CAAfyv36Si0=4mkXX-nmdY5fj64kZjqi1OC1MBy2bkgqr=cxD5w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
Can I keep original developer as maintainer (as it;s just resurrection
of existing defconfig)? Thanks.
>
> Could you work on these improvements and send an updated version?
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
