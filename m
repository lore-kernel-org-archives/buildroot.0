From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 Sep 2020 15:42:34 +0200
Subject: [Buildroot] [PATCH 1/1] package/w_scan: fix build with gcc 10
In-Reply-To: <20200920093846.1158644-1-fontaine.fabrice@gmail.com>
References: <20200920093846.1158644-1-fontaine.fabrice@gmail.com>
Message-ID: <20200920154234.7fcaa54e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 20 Sep 2020 11:38:46 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/5640442cb4ba06bcbcf31540a64f5665862d39f7
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...002-si_types-h-fix-build-with-gcc-10.patch | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 package/w_scan/0002-si_types-h-fix-build-with-gcc-10.patch

I've applied to master, but I'm wondering if we really want to keep
this package. It is not maintained, the homepage is only in German.
Yann, you added it in 2013. Does it still makes sense to have it? Is
there some modern and maintained replacement available?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
