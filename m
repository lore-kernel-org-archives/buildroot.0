From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 14 Mar 2019 21:54:05 +0100
Subject: [Buildroot] [PATCH 1/1] package/liblo: bump to version 0.30
In-Reply-To: <20190313182343.2916-1-fontaine.fabrice@gmail.com>
References: <20190313182343.2916-1-fontaine.fabrice@gmail.com>
Message-ID: <20190314215405.2d612647@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 13 Mar 2019 19:23:43 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Remove both patches (already in version)
> - Add sha256 hash
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-server-use-correct-poll.h-header.patch    | 32 ----------------------
>  ...rc-server.c-fix-stringop-truncation-error.patch | 30 --------------------
>  package/liblo/liblo.hash                           |  7 +++--
>  package/liblo/liblo.mk                             |  2 +-
>  4 files changed, 5 insertions(+), 66 deletions(-)
>  delete mode 100644 package/liblo/0001-server-use-correct-poll.h-header.patch
>  delete mode 100644 package/liblo/0002-src-server.c-fix-stringop-truncation-error.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
