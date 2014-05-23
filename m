From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 23 May 2014 13:35:45 -0300
Subject: [Buildroot] [PATCH] Add support for Ariag25 and Terra board
 from Acmesystems
In-Reply-To: <1400859951-21323-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1400859951-21323-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <537F78E1.9000300@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/23/2014 12:45 PM, Angelo Compagnucci wrote:

> This patch adds support for Acmesystems' AriaG25 SOM and the
> corresponding Terra demo board.
> The AriaG25 config is fairly basic, it provides only the minimal
> configuration to get the module booting.
> The Terra config instead provides many userspace tools.
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> ---
>  board/acmesystems/ariag25/at91-ariag25.config      | 2583 ++++++++++++++++++++
>  board/acmesystems/ariag25/at91-ariag25.dts         |  191 ++
>  .../fs-overlay/etc/network/interfaces              |    5 +
>  configs/ariag25_defconfig                          | 2070 ++++++++++++++++
>  configs/ariag25_demo_terra_defconfig               | 1942 +++++++++++++++
>  5 files changed, 6791 insertions(+)
>  create mode 100644 board/acmesystems/ariag25/at91-ariag25.config
>  create mode 100644 board/acmesystems/ariag25/at91-ariag25.dts
>  create mode 100644 board/acmesystems/ariag25_terra/fs-overlay/etc/network/interfaces
>  create mode 100644 configs/ariag25_defconfig
>  create mode 100644 configs/ariag25_demo_terra_defconfig

Hi Angelo.
Could you use proper defconfigs instead of plain .config files? (make
savedefconfig, buildroot & kernel).
They're unnecessarily huge with redundant information.
Thanks!
Regards.
