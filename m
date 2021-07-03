From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Jul 2021 22:13:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/libconfig: bump to version 1.7.3
In-Reply-To: <20210621190127.251960-1-fontaine.fabrice@gmail.com>
References: <20210621190127.251960-1-fontaine.fabrice@gmail.com>
Message-ID: <20210703221356.0525fb92@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 21 Jun 2021 21:01:27 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop patch (already in version)
> - Use --disable-tests which is available since
>   https://github.com/hyperrealm/libconfig/commit/7e2c1e6ac1f7c80a60c77bf1842edd112fe72188
> 
> https://github.com/hyperrealm/libconfig/releases/tag/v1.7.3
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-Add-disable-doc-option.patch         | 54 -------------------
>  package/libconfig/libconfig.hash              |  2 +-
>  package/libconfig/libconfig.mk                |  8 ++-
>  3 files changed, 4 insertions(+), 60 deletions(-)
>  delete mode 100644 package/libconfig/0001-Add-disable-doc-option.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
