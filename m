From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Apr 2019 16:04:06 +0200
Subject: [Buildroot] [PATCH 1/2] package/libtorrent-rasterbar: bump to
 version 1.2.0
In-Reply-To: <20190418124451.25968-1-fontaine.fabrice@gmail.com>
References: <20190418124451.25968-1-fontaine.fabrice@gmail.com>
Message-ID: <20190420160406.2b3432cc@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 18 Apr 2019 14:44:50 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop boost-chrono, replaced by std::chrono since
>   https://github.com/arvidn/libtorrent/commit/78bc2698327069aa69ff7460b9314cbe45bd4d66
> - Drop boost random, replace by standard number classes since
>   https://github.com/arvidn/libtorrent/commit/fef94a4c5254e2280b601ab3ea211cc0193fecaa
> - Add two patches to fix build on uclibc
> - Needs exception_ptr since
>   https://github.com/arvidn/libtorrent/commit/5c361715da9d20d63b019d7fc4ce772cdecd7138
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-add-missing-cstdarg-include.patch    | 37 +++++++++++++++++++
>  .../0002-buffer.hpp-fix-build-on-uclibc.patch | 29 +++++++++++++++
>  package/libtorrent-rasterbar/Config.in        |  8 +++-
>  .../libtorrent-rasterbar.hash                 |  2 +-
>  .../libtorrent-rasterbar.mk                   |  2 +-
>  5 files changed, 74 insertions(+), 4 deletions(-)
>  create mode 100644 package/libtorrent-rasterbar/0001-add-missing-cstdarg-include.patch
>  create mode 100644 package/libtorrent-rasterbar/0002-buffer.hpp-fix-build-on-uclibc.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
