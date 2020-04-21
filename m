From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Apr 2020 08:27:35 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/gerbera: bump to version
 1.4.0
In-Reply-To: <20200420064817.11124-1-joerg.krause@embedded.rocks>
References: <20200420064817.11124-1-joerg.krause@embedded.rocks>
Message-ID: <20200421082735.7af99a84@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 20 Apr 2020 08:48:17 +0200
J?rg Krause <joerg.krause@embedded.rocks> wrote:

> Also:
>  * Drop patch 0001 (fix static linking of libmagic) applied upstream
>  * Add optional dependency on libmatroska
>  * Add upstream patch to fix building with libmatroska
>  * Adjust spacing in hash file to 2 spaces
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
> v2:
>  * Add missing "Backported from" to upstream patch
> ---
>  ...indLibMagic.cmake-fix-static-linking.patch | 60 -------------------
>  ...build-without-js-taglib-or-atrailers.patch | 51 ++++++++++++++++
>  package/gerbera/config.xml                    |  4 ++
>  package/gerbera/gerbera.hash                  |  4 +-
>  package/gerbera/gerbera.mk                    |  9 ++-
>  5 files changed, 65 insertions(+), 63 deletions(-)
>  delete mode 100644 package/gerbera/0001-cmake-FindLibMagic.cmake-fix-static-linking.patch
>  create mode 100644 package/gerbera/0001-fix-matroska-build-without-js-taglib-or-atrailers.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
