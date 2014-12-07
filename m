From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Dec 2014 23:04:01 +0100
Subject: [Buildroot] [PATCH] configs: add sample for freescale p2020ds
In-Reply-To: <1417635538-17557-1-git-send-email-gustavo@zacarias.com.ar>
References: <1417635538-17557-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141207230401.375c7b9f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed,  3 Dec 2014 16:38:58 -0300, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  board/freescale/p2020ds/linux-3.12.config          | 374 +++++++++++++++++++++
>  .../p2020ds/linux-fix-c6187597-breakage.patch      |  51 +++
>  board/freescale/p2020ds/readme.txt                 |  40 +++
>  configs/freescale_p2020ds_defconfig                |  26 ++
>  4 files changed, 491 insertions(+)
>  create mode 100644 board/freescale/p2020ds/linux-3.12.config
>  create mode 100644 board/freescale/p2020ds/linux-fix-c6187597-breakage.patch
>  create mode 100644 board/freescale/p2020ds/readme.txt
>  create mode 100644 configs/freescale_p2020ds_defconfig

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
