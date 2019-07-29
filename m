From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 29 Jul 2019 09:11:34 +0200
Subject: [Buildroot] [PATCH 1/1] package/suricata: fix build with kernel
 >= 5.2
In-Reply-To: <20190722161449.10624-1-bernd.kuhls@t-online.de>
References: <20190722161449.10624-1-bernd.kuhls@t-online.de>
Message-ID: <20190729091134.6d0f6474@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 22 Jul 2019 18:14:49 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Fixes:
> http://autobuild.buildroot.net/results/422/422e1aa4e7d0bac31b55e7150a7ab031e23cef4a/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...et-fix-build-on-recent-Linux-kernels.patch | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 package/suricata/0002-af-packet-fix-build-on-recent-Linux-kernels.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
