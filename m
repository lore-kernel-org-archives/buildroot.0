From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Oct 2019 22:33:03 +0200
Subject: [Buildroot] [PATCH 1/2] core/pkg-meson: allow packages to add
 extra [binaries]
In-Reply-To: <be7aee4db475150e52b2c7a36979c89537d79a86.1569701061.git.yann.morin.1998@free.fr>
References: <cover.1569701061.git.yann.morin.1998@free.fr>
 <be7aee4db475150e52b2c7a36979c89537d79a86.1569701061.git.yann.morin.1998@free.fr>
Message-ID: <20191005223303.0c35239a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 28 Sep 2019 22:04:30 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> meson does not allow passing path to helper programs (e.g. pkgconfig)
> using variables in the environment. Instead, it insists that those paths
> be defined in the cross-compilation.conf file, in the [binaries]
> section [0]
> 
> As such, allow packages to declare such a list of arbitrary entries to
> add in the [binaries] section.
> 
> [0] https://github.com/mesonbuild/meson/issues/3327 for the LLVM_CONFIG
>     example, which we'll address in a follow=up patch.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> Cc: Peter Seiderer <ps.report@gmx.net>
> Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>  docs/manual/adding-packages-meson.txt | 7 +++++++
>  package/pkg-meson.mk                  | 3 +++
>  2 files changed, 10 insertions(+)

Both applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
