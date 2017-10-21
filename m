From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Oct 2017 22:37:50 +0200
Subject: [Buildroot] [PATCH v3 01/11] board: Add Bananapi M1 support
In-Reply-To: <1508406333-27138-2-git-send-email-jagan@amarulasolutions.com>
References: <1508406333-27138-1-git-send-email-jagan@amarulasolutions.com>
 <1508406333-27138-2-git-send-email-jagan@amarulasolutions.com>
Message-ID: <20171021223750.3c598d1e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 19 Oct 2017 11:45:23 +0200, Jagan Teki wrote:
> Add initial support for bananapi M1 board with below features:
> - U-Boot 2017.09
> - Linux 4.17
> - Default packages from buildroot
> 
> Cc: Jason <manager@sinovoip.com.cn>
> Cc: hailymei at banana-pi.com <hailymei@banana-pi.com>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>  .gitlab-ci.yml                          |  1 +
>  DEVELOPERS                              |  2 ++
>  board/bananapi/bananapi-m1/boot.cmd     |  7 +++++++
>  board/bananapi/bananapi-m1/genimage.cfg | 33 +++++++++++++++++++++++++++++
>  board/bananapi/bananapi-m1/readme.txt   | 37 +++++++++++++++++++++++++++++++++
>  configs/bananapi_m1_defconfig           | 37 +++++++++++++++++++++++++++++++++
>  6 files changed, 117 insertions(+)
>  create mode 100644 board/bananapi/bananapi-m1/boot.cmd
>  create mode 100644 board/bananapi/bananapi-m1/genimage.cfg
>  create mode 100644 board/bananapi/bananapi-m1/readme.txt
>  create mode 100644 configs/bananapi_m1_defconfig

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
