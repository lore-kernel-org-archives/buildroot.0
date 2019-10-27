From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 10:15:34 +0100
Subject: [Buildroot] [PATCH 1/1] package/libopenh264: fix mips build
In-Reply-To: <20191026190306.12083-1-bernd.kuhls@t-online.de>
References: <20191026190306.12083-1-bernd.kuhls@t-online.de>
Message-ID: <20191027101534.515289b6@windsurf.dhcp.lyon.intranet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 26 Oct 2019 21:03:06 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Although this PR is still discussed upstream it
> 
> Fixes:
> http://autobuild.buildroot.net/results/081/081c0426dde94015f5391e612454fc0b86888943/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../0002-Adjust-the-mmi-msa-detection-m.patch | 385 ++++++++++++++++++
>  1 file changed, 385 insertions(+)
>  create mode 100644 package/libopenh264/0002-Adjust-the-mmi-msa-detection-m.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
