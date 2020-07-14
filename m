From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jul 2020 22:54:32 +0200
Subject: [Buildroot] [PATCH 1/1] package/libnfc: bump to version 1.8.0
In-Reply-To: <20200625221026.1697178-1-fontaine.fabrice@gmail.com>
References: <20200625221026.1697178-1-fontaine.fabrice@gmail.com>
Message-ID: <20200714225432.38ef33e9@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 26 Jun 2020 00:10:25 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Retrieve first patch from upstream (BUILD_EXAMPLES is already in
>   CMakeLists.txt)
> - Update indentation in hash file (two spaces)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...utotools-make-example-build-optional.patch | 69 ++++++++++++++++
>  ...-systems-make-example-build-optional.patch | 82 -------------------
>  package/libnfc/libnfc.hash                    |  4 +-
>  package/libnfc/libnfc.mk                      |  2 +-
>  4 files changed, 72 insertions(+), 85 deletions(-)
>  create mode 100644 package/libnfc/0001-autotools-make-example-build-optional.patch
>  delete mode 100644 package/libnfc/0001-build-systems-make-example-build-optional.patch

Applied to master, thanks for having submitted the patch upstream!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
