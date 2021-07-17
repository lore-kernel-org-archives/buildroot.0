From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 17 Jul 2021 10:12:55 +0200
Subject: [Buildroot] [PATCH 1/5] package/duktape/duktape.pc.in: New file
In-Reply-To: <20210705054100.2857251-2-aduskett@gmail.com>
References: <20210705054100.2857251-1-aduskett@gmail.com>
 <20210705054100.2857251-2-aduskett@gmail.com>
Message-ID: <20210717101255.3dca9281@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun,  4 Jul 2021 22:40:56 -0700
Adam Duskett <aduskett@gmail.com> wrote:

> Most distributions include a duktape.pc file bundled with the duktape
> development package. As the duktape source does not include a .pc file,
> add one to the package/duktape directory and install it to the staging
> directory. This is used by the polkit duktape patch later in the series.
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>  package/duktape/duktape.mk    |  4 ++++
>  package/duktape/duktape.pc.in | 10 ++++++++++
>  2 files changed, 14 insertions(+)
>  create mode 100644 package/duktape/duktape.pc.in

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
