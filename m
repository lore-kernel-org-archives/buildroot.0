From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Oct 2019 21:42:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/suricata: fix build without
 geoip
In-Reply-To: <20191006082237.9655-1-fontaine.fabrice@gmail.com>
References: <20191006082237.9655-1-fontaine.fabrice@gmail.com>
Message-ID: <20191007214236.32e18f20@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  6 Oct 2019 10:22:37 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/a7a34f760ae5fe0922fdb720b8234dbcd85ed222
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0002-configure.ac-fix-disable-geoip.patch | 33 +++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 package/suricata/0002-configure.ac-fix-disable-geoip.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
