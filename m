From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 27 May 2017 17:34:41 -0300
Subject: [Buildroot] [PATCH] imx6q-sabresd: Add a qt5 defconfig variant
In-Reply-To: <1492870186-31678-1-git-send-email-festevam@gmail.com>
References: <1492870186-31678-1-git-send-email-festevam@gmail.com>
Message-ID: <CAOMZO5B2PZ5WbyWMXSSA1+u3s=-QWVNAzUN4Bk+cq2k4k=6kCQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Apr 22, 2017 at 11:09 AM, Fabio Estevam <festevam@gmail.com> wrote:
> Introduce imx6q-sabresd_qt5_defconfig that supports the opensource
> Etnaviv graphical stack.
>
> This defconfig provides a way to quickly test some graphical applications,
> such as kmscube, qt5, glmark2.
>
> Currently kernel mainline exhibits issues when running cpufreq as ondemand
> governor on mx6, so add a linux fragment that disables such option for the
> time being.
>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

A gentle ping.
