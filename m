From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 22 Nov 2017 23:32:11 +0530
Subject: [Buildroot] [PATCH v4 2/3] board: Add Vyasa RK388 board support
In-Reply-To: <1510997329-4111-2-git-send-email-jagan@amarulasolutions.com>
References: <1510997329-4111-1-git-send-email-jagan@amarulasolutions.com>
 <1510997329-4111-2-git-send-email-jagan@amarulasolutions.com>
Message-ID: <CAMty3ZD6y5Vz-chm3GM_WV30cTN=RB9ojouqMP=wWsGtUkHX=w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Nov 18, 2017 at 2:58 PM, Jagan Teki <jagannadh.teki@gmail.com> wrote:
> Add Vyasa board, from rk3288 family SOC.
>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v4:
> - Use liux-next
> - Add linux_gmac.fragment, rockchip gmac as module
> - Add evetest command
> - enable BR2_LINUX_KERNEL_INSTALL_TARGET
> Changes for v3:
> - Fix ascending order in DEVELOPERS
> - Fix u-boot-dtb.img offset
> - Fix extlinux.conf label
> Changes for v2:
> - Bump to U-Boot v2017.11
> - Bump to linux-next

Any further comments?

thanks!
-- 
Jagan Teki
Senior Linux Kernel Engineer | Amarula Solutions
U-Boot, Linux | Upstream Maintainer
Hyderabad, India.
