From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Nov 2017 22:20:00 +0100
Subject: [Buildroot] [NEXT 1/1] bash: bump to 4.4.12
In-Reply-To: <20171120140546.23268-1-aduskett@gmail.com>
References: <20171120140546.23268-1-aduskett@gmail.com>
Message-ID: <20171122222000.5a7ada7d@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 20 Nov 2017 09:05:46 -0500, Adam Duskett wrote:
> In addition, remove upstreamed patches and add a hash for the license file.
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>  package/bash/bash.hash        |   3 +-
>  package/bash/bash.mk          |   2 +-
>  package/bash/bash44-001.patch |  64 ----------------
>  package/bash/bash44-002.patch |  73 -------------------
>  package/bash/bash44-003.patch |  62 ----------------
>  package/bash/bash44-004.patch |  88 ----------------------
>  package/bash/bash44-005.patch |  51 -------------
>  package/bash/bash44-006.patch |  63 ----------------
>  package/bash/bash44-007.patch | 155 ---------------------------------------
>  package/bash/bash44-008.patch |  88 ----------------------
>  package/bash/bash44-009.patch | 111 ----------------------------
>  package/bash/bash44-010.patch |  53 --------------
>  package/bash/bash44-011.patch |  54 --------------
>  package/bash/bash44-012.patch | 165 ------------------------------------------
>  14 files changed, 3 insertions(+), 1029 deletions(-)
>  delete mode 100644 package/bash/bash44-001.patch
>  delete mode 100644 package/bash/bash44-002.patch
>  delete mode 100644 package/bash/bash44-003.patch
>  delete mode 100644 package/bash/bash44-004.patch
>  delete mode 100644 package/bash/bash44-005.patch
>  delete mode 100644 package/bash/bash44-006.patch
>  delete mode 100644 package/bash/bash44-007.patch
>  delete mode 100644 package/bash/bash44-008.patch
>  delete mode 100644 package/bash/bash44-009.patch
>  delete mode 100644 package/bash/bash44-010.patch
>  delete mode 100644 package/bash/bash44-011.patch
>  delete mode 100644 package/bash/bash44-012.patch

Applied to next, thanks. I've added a link to the PGP signature file,
as suggested by Baruch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
