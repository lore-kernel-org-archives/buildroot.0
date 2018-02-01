From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 1 Feb 2018 16:04:02 +0530
Subject: [Buildroot] [PATCH v9 1/3] board: Add Vyasa RK3288 board support
In-Reply-To: <1517313835-21973-1-git-send-email-jagan@amarulasolutions.com>
References: <1517313835-21973-1-git-send-email-jagan@amarulasolutions.com>
Message-ID: <CAMty3ZDqZJTCa+fjRC+APxQJXvx=WR-UYYCBMSt-+5VSJn5inQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jan 30, 2018 at 5:33 PM, Jagan Teki <jagannadh.teki@gmail.com> wrote:
> Add Vyasa board, from rk3288 family SOC.
>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v9:
> - Rebase on master
> Changes for v8:
> - Rebase on master
> Changes for v7:
> - Rebase on master
> Changes for v6:
> - None
> Changes for v5:
> - Add host-uboot-tools
> - Fix commit message
> - Drop Qt5 configs
> Changes for v4:
> - enable BR2_LINUX_KERNEL_INSTALL_TARGET
> - enable BR2_TARGET_UBOOT_FORMAT_DTB_BINe
> - Create single u-boot binary
> - Use linux-4.12 along with same headers
>
>  .gitlab-ci.yml                          |  1 +
>  DEVELOPERS                              |  2 ++
>  board/amarula/vyasa/extlinux.conf       |  4 +++
>  board/amarula/vyasa/genimage.cfg        | 21 +++++++++++++++
>  board/amarula/vyasa/linux_gmac.fragment |  3 +++
>  board/amarula/vyasa/post-build.sh       |  9 +++++++
>  board/amarula/vyasa/readme.txt          | 31 ++++++++++++++++++++++
>  configs/amarula_vyasa_rk3288_defconfig  | 46 +++++++++++++++++++++++++++++++++
>  8 files changed, 117 insertions(+)
>  create mode 100644 board/amarula/vyasa/extlinux.conf
>  create mode 100644 board/amarula/vyasa/genimage.cfg
>  create mode 100644 board/amarula/vyasa/linux_gmac.fragment
>  create mode 100755 board/amarula/vyasa/post-build.sh
>  create mode 100644 board/amarula/vyasa/readme.txt
>  create mode 100644 configs/amarula_vyasa_rk3288_defconfig

These been in ML, since from couple months any chance to comment or
picking up these.

thanks!
-- 
Jagan Teki
Senior Linux Kernel Engineer | Amarula Solutions
U-Boot, Linux | Upstream Maintainer
Hyderabad, India.
