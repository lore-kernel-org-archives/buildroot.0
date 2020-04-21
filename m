From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 21 Apr 2020 16:28:53 -0300
Subject: [Buildroot] [PATCHv2 08/12]
 configs/engicam_imx6qdl_icore_qt5_defconfig: needs udev to select glmark2
In-Reply-To: <20200421172646.3340666-8-romain.naour@gmail.com>
References: <20200421172646.3340666-1-romain.naour@gmail.com>
 <20200421172646.3340666-8-romain.naour@gmail.com>
Message-ID: <CAOMZO5Bwbm071cmEC21ojs6h=ZO4StR_2--1RXHsrEQVQbsLpg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Apr 21, 2020 at 2:26 PM Romain Naour <romain.naour@gmail.com> wrote:
>
> The BR2_PACKAGE_GLMARK2 is lost while loading the defconfig with:
> make engicam_imx6qdl_icore_qt5_defconfig
>
> In order to select gmark2 package, BR2_PACKAGE_GLMARK2_FLAVOR_ANY option
> must be set.
>
> Based on the defconfig without X11 and wayland package, the only missing
> option to select BR2_PACKAGE_GLMARK2_FLAVOR_ANY is BR2_PACKAGE_HAS_UDEV.
> The only possible option is to enable one of the udev provider
> (eudev or systemd). Select eudev package for /dev management.
>
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Fabio Estevam <festevam@gmail.com>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
