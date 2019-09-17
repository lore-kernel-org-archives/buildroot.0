From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 17 Sep 2019 23:13:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/rpcbind: bump to version 1.2.5
In-Reply-To: <20190916183103.6732-1-fontaine.fabrice@gmail.com>
References: <20190916183103.6732-1-fontaine.fabrice@gmail.com>
Message-ID: <20190917231337.31f95296@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 16 Sep 2019 20:31:03 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Remove all patches except first one (already in version)
> - Add hash for license file
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...n-t-use-the-xp_auth-pointer-directly.patch |  42 ---
>  ...0003-src-remove-use-of-the-__P-macro.patch | 243 ------------------
>  ...-svc_getargs-calls-with-svc_freeargs.patch | 231 -----------------
>  ...it_com-Stop-freeing-a-static-pointer.patch |  98 -------
>  ...dump-Fixed-typo-in-memory-leak-patch.patch |  31 ---
>  package/rpcbind/rpcbind.hash                  |   3 +-
>  package/rpcbind/rpcbind.mk                    |   2 +-
>  7 files changed, 3 insertions(+), 647 deletions(-)
>  delete mode 100644 package/rpcbind/0002-handle_reply-Don-t-use-the-xp_auth-pointer-directly.patch
>  delete mode 100644 package/rpcbind/0003-src-remove-use-of-the-__P-macro.patch
>  delete mode 100644 package/rpcbind/0004-rpcbind-pair-all-svc_getargs-calls-with-svc_freeargs.patch
>  delete mode 100644 package/rpcbind/0005-rpcbproc_callit_com-Stop-freeing-a-static-pointer.patch
>  delete mode 100644 package/rpcbind/0006-pmapproc_dump-Fixed-typo-in-memory-leak-patch.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
