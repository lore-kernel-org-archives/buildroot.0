From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 Oct 2019 23:21:16 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/ffmpeg: broken on or1k with
 gcc < 9.x
In-Reply-To: <20190901203602.3911-1-bernd.kuhls@t-online.de>
References: <20190901203602.3911-1-bernd.kuhls@t-online.de>
Message-ID: <20191021232116.3f02006a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  1 Sep 2019 22:36:02 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Fixes:
> http://autobuild.buildroot.net/results/961/9618aeffa7d72162d6643a89470c4a01d044a2dc/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: only the old gcc5 toolchain was affected, building with gcc9 works
>     (Peter)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
