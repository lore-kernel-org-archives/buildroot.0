From: Jagan Teki <jagan@amarulasolutions.com>
Date: Fri, 3 Nov 2017 18:42:14 +0530
Subject: [Buildroot] [PATCH 1/2] uboot: Add support for U-Boot TPL
In-Reply-To: <1509044302-31218-1-git-send-email-jagan@amarulasolutions.com>
References: <1509044302-31218-1-git-send-email-jagan@amarulasolutions.com>
Message-ID: <CAMty3ZCxf42CwmG9ATkm=aHfhqhJtyWwJK4EMTB+kfURoef0Hg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Oct 27, 2017 at 12:28 AM, Jagan Teki <jagannadh.teki@gmail.com> wrote:
> TPL is first stage bootloader, On rk3288 vyasa board due to size
> limitation on SPL.
>
> Since the size of SPL can't be exceeded 0x8000 bytes in RK3288,
> it is not possible add new SPL features like Falcon mode or etc.
>
> So add TPL stage so-that adding new features to SPL is possible.
> - TPL: DRAM init, clocks
> - SPL: MMC, falcon, etc
>
> u-boot-tpl.bin is the file name.
>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---

May be it's early to ping, please let me know if you have any comments?

thanks!
-- 
Jagan Teki
Senior Linux Kernel Engineer | Amarula Solutions
U-Boot, Linux | Upstream Maintainer
Hyderabad, India.
