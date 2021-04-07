From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 7 Apr 2021 21:18:57 +0200
Subject: [Buildroot] [PATCH v2 0/9] Bump all skarnet/s6 packages
In-Reply-To: <plpxZ2rQkzsU9DXh9KqBF2vdELLSLGY6sNWMqx2wKo@cp4-web-027.plabs.ch>
References: <plpxZ2rQkzsU9DXh9KqBF2vdELLSLGY6sNWMqx2wKo@cp4-web-027.plabs.ch>
Message-ID: <30554d7c-4c68-7087-8108-58f02fb7e72f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07/04/2021 01:39, Dick Olsson wrote:
> This second revision now also include updates to all license files
> due to year change.
> 
> Dick Olsson (9):
>   package/skalibs: bump to version 2.10.0.2
>   package/execline: bump to version 2.8.0.0
>   package/s6: bump to version 2.10.0.2
>   package/s6-portable-utils: bump to version 2.2.3.1
>   package/s6-linux-utils: bump to version 2.5.1.4
>   package/s6-linux-init: bump to version 1.0.6.1
>   package/s6-dns: bump to version 2.3.5.0
>   package/s6-networking: bump to version 2.4.1.0
>   package/s6-rc: bump to version 0.5.2.1

 Series applied to master, except for s6-linux-init where the COPYING file has
the wrong hash.

 Regards,
 Arnout

> 
>  package/execline/execline.hash                |  4 +-
>  package/execline/execline.mk                  |  2 +-
>  package/s6-dns/s6-dns.hash                    |  4 +-
>  package/s6-dns/s6-dns.mk                      |  2 +-
>  package/s6-linux-init/s6-linux-init.hash      |  2 +-
>  package/s6-linux-init/s6-linux-init.mk        |  2 +-
>  package/s6-linux-utils/s6-linux-utils.hash    |  4 +-
>  package/s6-linux-utils/s6-linux-utils.mk      |  2 +-
>  package/s6-networking/s6-networking.hash      |  4 +-
>  package/s6-networking/s6-networking.mk        |  2 +-
>  .../s6-portable-utils/s6-portable-utils.hash  |  4 +-
>  .../s6-portable-utils/s6-portable-utils.mk    |  2 +-
>  package/s6-rc/s6-rc.hash                      |  4 +-
>  package/s6-rc/s6-rc.mk                        |  2 +-
>  package/s6/s6.hash                            |  4 +-
>  package/s6/s6.mk                              |  2 +-
>  ...ker-use-dummy-file-when-testing-libs.patch | 44 -------------------
>  package/skalibs/skalibs.hash                  |  4 +-
>  package/skalibs/skalibs.mk                    |  2 +-
>  19 files changed, 26 insertions(+), 70 deletions(-)
>  delete mode 100644 package/skalibs/0001-Make-linker-use-dummy-file-when-testing-libs.patch
> 
