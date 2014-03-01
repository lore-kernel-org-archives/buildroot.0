From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Mar 2014 23:56:18 +0100
Subject: [Buildroot] [PATCH 0/17 v2] Add new virtual-package
 infrastructure
In-Reply-To: <cover.1393695127.git.yann.morin.1998@free.fr>
References: <cover.1393695127.git.yann.morin.1998@free.fr>
Message-ID: <20140301235618.04b363a8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat,  1 Mar 2014 18:32:43 +0100, Yann E. MORIN wrote:

>       package/libgles: rename the _HAS and _PROVIDES variables
>       package/libegl: rename the _HAS and _PROVIDES variables
>       package/libopenmax: rename the _HAS and _PROVIDES variables
>       package/libopenvg: rename the _HAS and _PROVIDES variables
>       package/luainterpreter: rename the _HAS and _PROVIDES variables

I certainly agree to ensure that the kconfig symbol matches the package
name. However, I am not sure the renaming of BR2_PACKAGE_HAS_OPENGL_ES
to BR2_PACKAGE_HAS_LIBGLES is really nice. BR2_PACKAGE_HAS_OPENGL_ES
had the merit of explicitly containing the word "OpenGL", while LIBGLES
makes that a bit more cryptic. Do we want to instead rename the package
to libopengl-es or some other variation on this?

A similar reflexion could be made on the naming of the libegl package.

Of course, I'm open to other opinions on this, the above comments are
not really a very strong opinion on my side.

My original plan was to apply patches 1 -> 6 of your series in order to
remove you a bunch of patches to handle, but I'm not sure about these
renames.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
