From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 16 Jul 2021 23:17:08 +0200
Subject: [Buildroot] [PATCH 1/1] package/qpid-proton: bump to version
 0.35.0
In-Reply-To: <20210710142135.1328702-1-fontaine.fabrice@gmail.com>
References: <20210710142135.1328702-1-fontaine.fabrice@gmail.com>
Message-ID: <20210716231708.0b8e64b0@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, 10 Jul 2021 16:21:35 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop patches (already in version)
> - host-python3 is mandatory since
>   https://github.com/apache/qpid-proton/commit/70ace037684f39c2d68681ef32302d38a9e06fac
> 
> https://qpid.apache.org/releases/qpid-proton-0.35.0/release-notes.html
> https://qpid.apache.org/releases/qpid-proton-0.34.0/release-notes.html
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...r-epoll-internal.h-fix-build-on-musl.patch | 43 -------------
>  ...N-2355-Fix-build-with-DPROACTOR-none.patch | 61 -------------------
>  package/qpid-proton/qpid-proton.hash          |  4 +-
>  package/qpid-proton/qpid-proton.mk            |  6 +-
>  4 files changed, 5 insertions(+), 109 deletions(-)
>  delete mode 100644 package/qpid-proton/0001-c-src-proactor-epoll-internal.h-fix-build-on-musl.patch
>  delete mode 100644 package/qpid-proton/0002-PROTON-2355-Fix-build-with-DPROACTOR-none.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
