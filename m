From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 6 Dec 2019 23:45:18 +0100
Subject: [Buildroot] [PATCH 1/1] package/arptables: bump to version 0.0.5
In-Reply-To: <20191204191144.2591797-1-fontaine.fabrice@gmail.com>
References: <20191204191144.2591797-1-fontaine.fabrice@gmail.com>
Message-ID: <20191206234518.03c45118@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  4 Dec 2019 20:11:44 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Update site to retrieve latest version
> - Remove first, second and third patches (already in version)
> - Use the new COPYING file as the license file
> - arptables binary is now named arptables-legacy since
>   http://git.netfilter.org/arptables/commit/?id=28b22d55615447c94c5058e0aacec612ebc27f2a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ....patch => 0001-Fix-musl-build-issue.patch} |   0
>  ...01-arptables-disable-dlfcn.h-include.patch |  32 -----
>  .../arptables/0002-src-Use-stdint-types.patch | 134 ------------------
>  .../0003-src-Remove-support-for-libc5.patch   |  64 ---------
>  package/arptables/Config.in                   |  11 +-
>  package/arptables/arptables.hash              |   7 +-
>  package/arptables/arptables.mk                |   9 +-
>  7 files changed, 18 insertions(+), 239 deletions(-)
>  rename package/arptables/{0004-Fix-musl-build-issue.patch => 0001-Fix-musl-build-issue.patch} (100%)
>  delete mode 100644 package/arptables/0001-arptables-disable-dlfcn.h-include.patch
>  delete mode 100644 package/arptables/0002-src-Use-stdint-types.patch
>  delete mode 100644 package/arptables/0003-src-Remove-support-for-libc5.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
