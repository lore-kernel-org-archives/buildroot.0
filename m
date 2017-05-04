From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 4 May 2017 09:36:07 -0300
Subject: [Buildroot] [PATCH] imx6q-sabresd: Add a qt5 defconfig variant
In-Reply-To: <1492870186-31678-1-git-send-email-festevam@gmail.com>
References: <1492870186-31678-1-git-send-email-festevam@gmail.com>
Message-ID: <CAOMZO5BPu8UWkFZubWn0gc4gvGDXxm7tB2AWe3s8bg8rADuP2w@mail.gmail.com>
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

Would it be possible to have this defconfig as part of the next
Buildroot release?

It would be very convenient for testing mx6 with kernel
mainline/Mesa/Etnaviv/Qt5.

Thanks
