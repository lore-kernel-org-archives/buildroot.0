From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Sep 2020 21:34:01 +0200
Subject: [Buildroot] [PATCH 1/1] package/olsr: fix build with bison 3.7.1
In-Reply-To: <20200906203519.48776-1-fontaine.fabrice@gmail.com>
References: <20200906203519.48776-1-fontaine.fabrice@gmail.com>
Message-ID: <20200907213401.45bbee04@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  6 Sep 2020 22:35:19 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/174f64f5663e655eb97994b903293c07c70268fe
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...1-olsrd-migrate-to-using-bison-3.7.1.patch | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 package/olsr/0001-olsrd-migrate-to-using-bison-3.7.1.patch

Applied to master, thanks. However, I think your fix is not suitable
for upstream. Indeed, most likely upstream will not want a solution
that forces to have Bison >= 3.7.1, they will probably want to support
building on older systems that have an older Bison version.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
