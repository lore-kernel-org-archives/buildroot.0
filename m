From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 Oct 2019 23:22:18 +0200
Subject: [Buildroot] [PATCH 1/1] package/apr: Fix PATH_MAX detection by
 including sys/param.h if available
In-Reply-To: <20190929153436.22933-1-bernd.kuhls@t-online.de>
References: <20190929153436.22933-1-bernd.kuhls@t-online.de>
Message-ID: <20191021232218.1aef0f4e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 29 Sep 2019 17:34:36 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Fixes subversion build error.
> 
> Fixes:
> http://autobuild.buildroot.net/results/d42/d42be423c1c6fe7e7c419976ff35a04e18dfb8dd/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/apr/0002-sys-param-h.patch | 39 ++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 package/apr/0002-sys-param-h.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
