From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Apr 2018 17:41:52 +0200
Subject: [Buildroot] [PATCH 1/4] libfm: bump to version 1.3.0.2
In-Reply-To: <20180429190906.25476-1-fontaine.fabrice@gmail.com>
References: <20180429190906.25476-1-fontaine.fabrice@gmail.com>
Message-ID: <20180430174152.0441ac19@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 29 Apr 2018 21:09:03 +0200, Fabrice Fontaine wrote:
> Add hash for license files
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../libfm/0001-modules-fix-cross-compilation.patch | 27 ++++++++++++++++++++++
>  package/libfm/libfm.hash                           |  8 +++++--
>  package/libfm/libfm.mk                             |  4 +++-
>  3 files changed, 36 insertions(+), 3 deletions(-)
>  create mode 100644 package/libfm/0001-modules-fix-cross-compilation.patch

Series applied, thanks. Please make sure to submit
package/libfm/0001-modules-fix-cross-compilation.patch to the upstream
project. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
