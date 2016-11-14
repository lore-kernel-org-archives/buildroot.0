From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 14 Nov 2016 15:30:55 -0200
Subject: [Buildroot] [PATCH] config: bump U-Boot to 2016.11-rc3 in
 synopsys defconfigs
In-Reply-To: <1479138470-47444-1-git-send-email-vzakhar@synopsys.com>
References: <1479138470-47444-1-git-send-email-vzakhar@synopsys.com>
Message-ID: <CAOMZO5Bqnt+YH8QUz2PXVSocqjNO3vUk4MGRVH1icz_TRQikvA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Nov 14, 2016 at 1:47 PM, Vlad Zakharov
<Vladislav.Zakharov@synopsys.com> wrote:
> With this commit we upgrade U-Boot version to 2016.11-rc3
> in "snps_axs101_defconfig" and "snps_axs103_defconfig".
>
> Important fixes: new version fixes U-Boot build for arc700.
> Since gcc-6.x "-marc700" option is no longer supported,
> "-mcpu=arc700" should be used instead.
>
> We haven't sent it before as we were waiting for U-Boot
> 2016.11 release. But as it unfortunately hasn't come up yet we
> bump U-Boot version to the latest release candidate.
> We are going to upgrade it to 2016.11 as soon as the release
> comes.

U-Boot 2016.11 is released now and I sent Buildroot patches bumping to
this version.
