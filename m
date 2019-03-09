From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 Mar 2019 14:52:07 +0100
Subject: [Buildroot] [PATCH 1/2] package/ncmpc: remove first patch
In-Reply-To: <20190309113127.24045-1-fontaine.fabrice@gmail.com>
References: <20190309113127.24045-1-fontaine.fabrice@gmail.com>
Message-ID: <20190309145207.16f806d3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  9 Mar 2019 12:31:26 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> This patch has been rejected by upstream however the issue has been
> fixed by a different approach since version 0.31 and
> https://github.com/MusicPlayerDaemon/ncmpc/commit/029523c8a2472e45213e50c1e3eb414245dd9d57
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...e_ptr-error-with-some-old-toolchains.patch | 54 -------------------
>  ...ild-add-atomic-dependency-for-sparc.patch} |  0
>  2 files changed, 54 deletions(-)
>  delete mode 100644 package/ncmpc/0001-Fix-unique_ptr-error-with-some-old-toolchains.patch
>  rename package/ncmpc/{0002-meson.build-add-atomic-dependency-for-sparc.patch => 0001-meson.build-add-atomic-dependency-for-sparc.patch} (100%)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
