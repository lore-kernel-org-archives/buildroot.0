From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 21 Dec 2019 22:35:54 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/qt5/qt5webengine: fix build
 error
In-Reply-To: <20191221111218.26960-1-b.bilas@grinn-global.com>
References: <20191221111218.26960-1-b.bilas@grinn-global.com>
Message-ID: <20191221223554.4f36a4aa@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 21 Dec 2019 12:12:18 +0100
Bartosz Bilas <b.bilas@grinn-global.com> wrote:

> This commit adds a patch from upstream chromium [1].
> 
> Fixes:
>   ../../3rdparty/chromium/third_party/skia/third_party/skcms/skcms.cc:1909:16:
>   note: in definition of macro 'NS'
>   #define NS(id) id
> 
> [1] https://chromium.googlesource.com/chromium/src/+/a8c8396fd20d98666d517c45b358c63736e345ef
> 
> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
> ---
> v1 -> v2:
>  - keep gcc 4.8 as a minimum required version (suggested by Giulio Benetti)
>  ..._config-Fixes-when-use_sysroot-false.patch | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 package/qt5/qt5webengine/5.12.5/0001-pkg_config-Fixes-when-use_sysroot-false.patch

Thanks! I've applied to master, after improving the commit log as
suggested from the first reply of Giulio.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
