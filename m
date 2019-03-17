From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Mar 2019 17:29:19 +0100
Subject: [Buildroot] [PATCH 1/1] package/wpan-tools: bump to version 0.9
In-Reply-To: <20190317160519.28904-1-fontaine.fabrice@gmail.com>
References: <20190317160519.28904-1-fontaine.fabrice@gmail.com>
Message-ID: <20190317172919.76ad6472@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 17 Mar 2019 17:05:19 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Switch site to github
> - Remove patch (already in version)
> - Add hash for license file
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...tras.h-fix-compatibility-with-libnl-3.3.0.patch | 49 ----------------------
>  package/wpan-tools/wpan-tools.hash                 |  7 ++--
>  package/wpan-tools/wpan-tools.mk                   |  7 ++--
>  3 files changed, 7 insertions(+), 56 deletions(-)
>  delete mode 100644 package/wpan-tools/0001-src-nl_extras.h-fix-compatibility-with-libnl-3.3.0.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
