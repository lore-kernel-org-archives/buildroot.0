From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Jan 2020 22:17:43 +0100
Subject: [Buildroot] [PATCH 1/1] package/proj: bump to version 6.3.0
In-Reply-To: <20200111220435.1892112-1-fontaine.fabrice@gmail.com>
References: <20200111220435.1892112-1-fontaine.fabrice@gmail.com>
Message-ID: <20200112221743.0dc38d80@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 11 Jan 2020 23:04:35 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Remove patches (already in version)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-proj.pc.in-add-Libs.Private.patch    | 27 ----------------
>  ....in-add-SQLITE3_LIBS-to-Libs.Private.patch | 32 -------------------
>  package/proj/proj.hash                        |  6 ++--
>  package/proj/proj.mk                          |  2 +-
>  4 files changed, 4 insertions(+), 63 deletions(-)
>  delete mode 100644 package/proj/0001-proj.pc.in-add-Libs.Private.patch
>  delete mode 100644 package/proj/0002-proj.pc.in-add-SQLITE3_LIBS-to-Libs.Private.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
