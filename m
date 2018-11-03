From: Jagan Teki <jagan@amarulasolutions.com>
Date: Sat, 3 Nov 2018 16:18:20 +0530
Subject: [Buildroot] [PATCH v6 1/2] board: amarula: Add A64-Relic support
In-Reply-To: <20181101142255.4a9d2316@windsurf>
References: <20181026130358.11776-1-jagan@amarulasolutions.com>
 <20181101142255.4a9d2316@windsurf>
Message-ID: <CAMty3ZB21E3jv1=eU3HjjX0+evAakYzgwcHYAtb3wvFuftn39g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Nov 1, 2018 at 6:52 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Jagan,
>
> On Fri, 26 Oct 2018 18:33:57 +0530, Jagan Teki wrote:
> > Add initial support for Amarula A64-Relic board
> > with below features:
> > - U-Boot 2018.07
> > - Linux 4.17.0-rc6
> > - Default packages from buildroot
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> > Changes for v6
> > - Use 2018.07 u-boot
> > - Use release tag for linux
> > - Add command to select u-boot UMS on readme.txt
> > Changes for v5:
> > - Rebase to master
> > - Fix DEVELOPERS file for proper position of amarula_a64_relic_defconfig
> > Changes for v4:
> > - remove sdcard.img image creation
> > - on readme 'cd output/images' not output/images
> > - add 'sudo' for fastboot commands on readme.txt
> > Changes for v3:
> > - Use 4.17 kernel headers
> > - Add wiki link
> > - Add BR2_PACKAGE_HOST_ANDROID_TOOLS_FASTBOOT
> > - Update comments on readme.txt suggested by Thomas
> > Changes for v2:
> > - Use mainline U-Boot
> > - Drop uboot.fragment since the UMS used for developement,
> >   so note it on readme.txt how to use.
> > - format the 'Write eMMC' steps suggested by Arnout.
> > - fix fastboot steps in readme.txt
> > - add offset in genimage.cfg for boot partition instead of size
>
> This patch was missing BR2_TARGET_UBOOT_NEEDS_PYLIBFDT and
> BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL for the build to succeed in a
> pristine build environment. I've fixed that, did a few minor tweaks
> (commit titles) and applied. Thanks!

Thanks for the help.

Jagan.
