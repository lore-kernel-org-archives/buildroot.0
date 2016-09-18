From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Sep 2016 20:09:34 +0200
Subject: [Buildroot] [PATCH 07/11] Add Linux Kernel stable v4.4.16 patch
 file for Aria G25
In-Reply-To: <1470827167-9426-9-git-send-email-biagio.hkr@gmail.com>
References: <1470827167-9426-1-git-send-email-biagio.hkr@gmail.com>
 <1470827167-9426-9-git-send-email-biagio.hkr@gmail.com>
Message-ID: <20160918200934.366e486d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 10 Aug 2016 13:06:03 +0200, Biagio Montaruli wrote:
> Signed-off-by: Biagio Montaruli <biagio.hkr@gmail.com>
> ---
>  .../aria-g25/patches/linux/linux-4.4.16-aria.patch | 388 +++++++++++++++++++++
>  1 file changed, 388 insertions(+)
>  create mode 100644 board/acmesystems/aria-g25/patches/linux/linux-4.4.16-aria.patch

Same question: why using 4.4 while the mainline kernel has support for
this platform without the need for a patch? Why introducing a new
defconfig rather than using at91_dt_defconfig?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
