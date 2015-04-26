From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Apr 2015 22:30:47 +0200
Subject: [Buildroot] [PATCH 7/8 v11] package.nvidia-tegra23-binaries:
 add gstreamer plugins
In-Reply-To: <bffb3274339a54ceb4f7857b849013cb217cf129.1429635674.git.yann.morin.1998@free.fr>
References: <cover.1429635674.git.yann.morin.1998@free.fr>
 <bffb3274339a54ceb4f7857b849013cb217cf129.1429635674.git.yann.morin.1998@free.fr>
Message-ID: <20150426223047.01b5eaea@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Tue, 21 Apr 2015 19:04:43 +0200, Yann E. MORIN wrote:
> From: Nicolas Serafini <nicolas.serafini@sensefly.com>
> 
> Signed-off-by: Nicolas Serafini <nicolas.serafini@sensefly.com>
> [yann.morin.1998 at free.fr: split out into their own patch]
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  .../nvidia-tegra23-binaries/Config.in              | 15 +++++++++++
>  .../nvidia-tegra23-binaries.mk                     | 30 ++++++++++++++++++++++
>  2 files changed, 45 insertions(+)

Applied, after doing some changes:

    [Thomas:
      - add missing libXv dependency.
      - remove the NVIDIA_TEGRA23_BINARIES_GSTREAMER_PLUGINS and
        NVIDIA_TEGRA23_BINARIES_MULTIMEDIA_APPS, and use simple 'cp -dpfr'
        calls to copy the plugins and sample applications.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
