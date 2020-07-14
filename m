From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jul 2020 23:49:43 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/libodb-mysql: fix static build
In-Reply-To: <20200714211804.2434281-1-fontaine.fabrice@gmail.com>
References: <20200714211804.2434281-1-fontaine.fabrice@gmail.com>
Message-ID: <20200714234943.2ecfea96@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 14 Jul 2020 23:18:04 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Use mysql_config to help libodb-mysql to retrieve mysql dependencies
> such as -lz
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/a5447c5105f15606ed562b39ca84c06e7e6b78c0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Thomas Petazzoni):
>  - Use mysql_config to avoid hardcoding -lz

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
