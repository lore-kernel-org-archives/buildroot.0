From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 2 Jan 2021 23:54:47 +0100
Subject: [Buildroot] [PATCH 1/1] package/c-ares: bump to version 1.17.1
In-Reply-To: <20201119215826.14126-1-fontaine.fabrice@gmail.com>
References: <20201119215826.14126-1-fontaine.fabrice@gmail.com>
Message-ID: <20210102235447.490cedfa@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 19 Nov 2020 22:58:26 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Drop patch (not needed since
> https://github.com/c-ares/c-ares/commit/b83731ddb6b7834fa0e1eb14a523603c3c040298)
> and so autoreconf
> 
> https://c-ares.haxx.se/changelog.html
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...c-lib-Makefile.am-install-ares_dns.h.patch | 37 -------------------
>  package/c-ares/c-ares.hash                    |  2 +-
>  package/c-ares/c-ares.mk                      |  4 +-
>  3 files changed, 2 insertions(+), 41 deletions(-)
>  delete mode 100644 package/c-ares/0001-src-lib-Makefile.am-install-ares_dns.h.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
