From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 1 May 2021 16:51:21 +0200
Subject: [Buildroot] [PATCH 00/10] Bump all skarnet packages
In-Reply-To: <EpyK3vbVbggszRoDfscZyQtYcRE7XwDFYOl5AAGibU@cp4-web-031.plabs.ch>
References: <EpyK3vbVbggszRoDfscZyQtYcRE7XwDFYOl5AAGibU@cp4-web-031.plabs.ch>
Message-ID: <ff179344-3f64-2946-d7bb-fc3b5286abc0@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28/04/2021 00:41, Dick Olsson via buildroot wrote:
> Quick bump of the latest releases on skarnet.org.
> 
> This patchset also adjusts hash file indentations on the packages
> that were not fixed already.

 Series applied to master, thanks.

 Regards,
 Arnout

> 
> Dick Olsson (10):
>   package/skalibs: bump to version 2.10.0.3
>   package/execline: bump to version 2.8.0.1
>   package/s6: bump to version 2.10.0.3
>   package/s6-rc: bump to version 0.5.2.2
>   package/s6-portable-utils: bump to version 2.2.3.2
>   package/s6-linux-utils: bump to version 2.5.1.5
>   package/s6-dns: bump to version 2.3.5.1
>   package/s6-networking: bump to version 2.4.1.1
>   package/s6-linux-init: bump to version 1.0.6.3
>   package/mdevd: bump to version 0.1.4.0
> 
>  package/execline/execline.hash                |   2 +-
>  package/execline/execline.mk                  |   2 +-
>  package/mdevd/mdevd.hash                      |   2 +-
>  package/mdevd/mdevd.mk                        |   2 +-
>  package/s6-dns/s6-dns.hash                    |   4 +-
>  package/s6-dns/s6-dns.mk                      |   2 +-
>  package/s6-linux-init/s6-linux-init.hash      |   2 +-
>  package/s6-linux-init/s6-linux-init.mk        |   2 +-
>  package/s6-linux-utils/s6-linux-utils.hash    |   4 +-
>  package/s6-linux-utils/s6-linux-utils.mk      |   2 +-
>  package/s6-networking/s6-networking.hash      |   4 +-
>  package/s6-networking/s6-networking.mk        |   2 +-
>  .../s6-portable-utils/s6-portable-utils.hash  |   4 +-
>  .../s6-portable-utils/s6-portable-utils.mk    |   2 +-
>  package/s6-rc/s6-rc.hash                      |   4 +-
>  package/s6-rc/s6-rc.mk                        |   2 +-
>  package/s6/s6.hash                            |   4 +-
>  package/s6/s6.mk                              |   2 +-
>  .../0001-Do-not-ld-into-dev-null.patch        | 115 ------------------
>  package/skalibs/skalibs.hash                  |   4 +-
>  package/skalibs/skalibs.mk                    |   2 +-
>  21 files changed, 27 insertions(+), 142 deletions(-)
>  delete mode 100644 package/skalibs/0001-Do-not-ld-into-dev-null.patch
> 
