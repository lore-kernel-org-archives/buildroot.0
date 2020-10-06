From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 6 Oct 2020 21:29:37 +0200
Subject: [Buildroot] [PATCH 1/2] package/efl: bump to version 1.25.0
In-Reply-To: <20201002160155.1530265-1-romain.naour@gmail.com>
References: <20201002160155.1530265-1-romain.naour@gmail.com>
Message-ID: <20201006212937.35dc9019@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  2 Oct 2020 18:01:54 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> Remove 0001-doc-meson.build-add-single-quote-for-env.patch superseeded
> by https://git.enlightenment.org/core/efl.git/commit/?id=e2a1cdfda76dd0061ef8e0ab25aee4e042304366
> 
> Rename luajit bindings to lua after upstream rework to support lua interpreter
> (non-luajit):
> 
> https://git.enlightenment.org/core/efl.git/commit/?id=5197200ac1d49366f205a62a09a377fdece62ff9
> https://git.enlightenment.org/core/efl.git/commit/?id=b0203b3160f2a39c3afe549fd34a513f71532fc3
> https://git.enlightenment.org/core/efl.git/commit/?id=f78d54051c26a8d3c9b3bfc61e44df09bf24e401
> https://git.enlightenment.org/core/efl.git/commit/?id=6dce869a17baae6002c3cec04e975c0730461a00
> 
> For now keep the luajit dependency as is. lua support can be enabled by a followup patch.
> 
> Disable the new avif evas loader and saver added by:
> https://git.enlightenment.org/core/efl.git/commit/?id=fd24e89144d8808e4e7ee20efe599ff4a6d3d37e
> 
> Remove elogind meson option removed by:
> https://git.enlightenment.org/core/efl.git/commit/?id=fe56edae3f5015c62e319d5e2ab2552d3533eead
> 
> See:
> https://www.enlightenment.org/news/efl-1.25.0
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: James Hilliard <james.hilliard1@gmail.com>
> ---
>  ...meson.build-add-single-quote-for-env.patch | 33 -------------------
>  ...s-drm-meson.build-use-gl_deps-as-en.patch} |  6 ++--
>  ...s-drm-meson.build-fix-gl_drm-includ.patch} |  6 ++--
>  package/efl/efl.hash                          |  4 +--
>  package/efl/efl.mk                            | 11 +++----
>  5 files changed, 13 insertions(+), 47 deletions(-)
>  delete mode 100644 package/efl/0001-doc-meson.build-add-single-quote-for-env.patch
>  rename package/efl/{0002-ecore_evas-engines-drm-meson.build-use-gl_deps-as-en.patch => 0001-ecore_evas-engines-drm-meson.build-use-gl_deps-as-en.patch} (87%)
>  rename package/efl/{0003-ecore_evas-engines-drm-meson.build-fix-gl_drm-includ.patch => 0002-ecore_evas-engines-drm-meson.build-fix-gl_drm-includ.patch} (89%)

Both applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
