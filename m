From: Baruch Siach <baruch@tkos.co.il>
Date: Sat, 03 Nov 2018 21:27:06 +0200
Subject: [Buildroot] [PATCH v2 2/4] board: orangepi: Add Orangepi One
 Plus support
In-Reply-To: <20181103125608.2255-2-jagan@amarulasolutions.com>
References: <20181103125608.2255-1-jagan@amarulasolutions.com>
 <20181103125608.2255-2-jagan@amarulasolutions.com>
Message-ID: <87zhuqner9.fsf@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jagan,

Jagan Teki writes:
> diff --git a/board/orangepi/orangepi-one-plus/extlinux.conf b/board/orangepi/orangepi-one-plus/extlinux.conf
> new file mode 100644
> index 0000000000..eae328449c
> --- /dev/null
> +++ b/board/orangepi/orangepi-one-plus/extlinux.conf
> @@ -0,0 +1,4 @@
> +label linux-4.18.0-rc3

This doesn't match the actual kernel version. I think you can just drop
the version from the label. It is easy to forget keeping it in sync with
the kernel version.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
