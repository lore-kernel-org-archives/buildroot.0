From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 29 Nov 2012 13:58:54 +0100
Subject: [Buildroot] [PATCH] libroxml: bump version to 2.2.1
In-Reply-To: <1354169996-22703-1-git-send-email-blunderer@blunderer.org>
References: <1354169996-22703-1-git-send-email-blunderer@blunderer.org>
Message-ID: <50B75C0E.4070200@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 29/11/12 07:19, blunderer at blunderer.org wrote:
> From: Tristan Lelong<tristan.lelong@blunderer.org>
>
> Signed-off-by: Tristan Lelong<tristan.lelong@blunderer.org>
> ---
>   package/libroxml/libroxml-2.2.0-werror.patch |   22 ----------------------
>   package/libroxml/libroxml-2.2.1-werror.patch |   22 ++++++++++++++++++++++

  Please send patches with the -M option to git send-email (or format-patch).
That will detect that this is just a rename.

  Please also rename it to libroxml-werror.patch, i.e. removing the version
number.  Nowadays, the policy is to make patches without version number,
unless a package supports several versions.


  Regards,
  Arnout

>   package/libroxml/libroxml.mk                 |    2 +-
>   3 files changed, 23 insertions(+), 23 deletions(-)
>   delete mode 100644 package/libroxml/libroxml-2.2.0-werror.patch
>   create mode 100644 package/libroxml/libroxml-2.2.1-werror.patch
[snip]
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
