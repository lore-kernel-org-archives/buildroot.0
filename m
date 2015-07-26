From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jul 2015 18:33:20 +0200
Subject: [Buildroot] [PATCH] package/rpi-userland: add option to install
 hello-pi examples
In-Reply-To: <1437815713-15874-1-git-send-email-yann.morin.1998@free.fr>
References: <1437815713-15874-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150726183320.2e55754d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 25 Jul 2015 11:15:13 +0200, Yann E. MORIN wrote:
> rpi-userland comes with a set of demo programs that can be useful to
> understand how to program HW-accelerated video/3D/fft/... on the RPi.
> 
> They can also be used to validate that the hardware is working properly.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  .../0005-disable-missing-all-apps.patch            | 30 ++++++++++++++++++++++
>  package/rpi-userland/Config.in                     |  5 ++++
>  package/rpi-userland/rpi-userland.mk               | 20 +++++++++++++++
>  3 files changed, 55 insertions(+)
>  create mode 100644 package/rpi-userland/0005-disable-missing-all-apps.patch

Applied with one minor change:

    [Thomas: explicitly pass ALL_APPS=OFF when
    BR2_PACKAGE_RPI_USERLAND_HELLO is disabled.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
