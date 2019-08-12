From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 12 Aug 2019 22:36:43 +0200
Subject: [Buildroot] [PATCH 1/1] package/micropython: fix build with gcc
 9
In-Reply-To: <20190811215028.32623-1-fontaine.fabrice@gmail.com>
References: <20190811215028.32623-1-fontaine.fabrice@gmail.com>
Message-ID: <20190812223643.4fdfc482@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 11 Aug 2019 23:50:28 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/087906ea63875bcea244aa8f1e551aecd8285f65
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ..._vsnprintf-alias-for-gcc-9-and-above.patch | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 package/micropython/0002-lib-utils-printf-Exclude-__GI_vsnprintf-alias-for-gcc-9-and-above.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
