From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Jul 2020 23:22:54 +0200
Subject: [Buildroot] [PATCH 1/1] package/minizip: use pkg-config to find
 zstd
In-Reply-To: <20200723205135.55024-1-fontaine.fabrice@gmail.com>
References: <20200723205135.55024-1-fontaine.fabrice@gmail.com>
Message-ID: <20200725232254.31b11166@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 23 Jul 2020 22:51:35 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix build with zstd in version 2.10.0
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/0fe0ca0a7d39f863614f2aecd9eefc20cd64daf4
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-Use-pkg-config-to-find-ZSTD.patch    | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 package/minizip/0001-Use-pkg-config-to-find-ZSTD.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
