From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 15 May 2021 08:05:18 +0800
Subject: [Buildroot] [PATCH 2/2] configs/beaglev: enable host
 jh71xx-tools
In-Reply-To: <20210514220316.1942381-3-thomas.petazzoni@bootlin.com>
References: <20210514220316.1942381-1-thomas.petazzoni@bootlin.com>
 <20210514220316.1942381-3-thomas.petazzoni@bootlin.com>
Message-ID: <CAEUhbmUdtA3VHBShJePiF9hVwRYDuKySXfOQzaqVbtRUsjX4Kw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, May 15, 2021 at 6:03 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> This host utility is useful to recover the bootloader.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  board/beaglev/readme.txt  | 4 +++-
>  configs/beaglev_defconfig | 1 +
>  2 files changed, 4 insertions(+), 1 deletion(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
