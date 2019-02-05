From: Adrian Perez de Castro <aperez@igalia.com>
Date: Tue, 5 Feb 2019 23:42:11 +0200
Subject: [Buildroot] [PATCH v2 0/4] WPE WebKit
In-Reply-To: <20190205204152.10376-1-francois.perrad@gadz.org>
References: <20190205204152.10376-1-francois.perrad@gadz.org>
Message-ID: <20190205234211.GF7361@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fran?ois,

On Tue,  5 Feb 2019 21:41:48 +0100, Francois Perrad <fperrad@gmail.com> wrote:
> Another port of WebKit (https://wpewebkit.org/), a project started in 2018.
> 
> v1 -> v2
>   - wpewebkit : use WPEWEBKIT_ARCH_SUPPORTS variables (duplicated from webkitgtk)
>   - cog : use release 0.2.0
>   - cog : add dbus as mandatory dependency
>   - cog : use the default setting of COG_DBUS_SYSTEM_BUS

The patch series looks good to me, and I think it can all be merged now :)
Thanks again for updating it!


-Adri?n

> rfc -> v1
>   - full refactor after Adrian's review
>   - libwpe : version 1.0.0 (stable) instead of 1.1.0 (instable)
>   - wbebackend-fdo : version 1.0.0 (stable) instead of 1.1.0 (instable)
>   - add cog, a WPE WebKit launcher
> 
> Francois Perrad (4):
>   libwpe: new package
>   wpebackend-fdo: new package
>   wpewebkit: new package
>   cog: new package
> 
>  DEVELOPERS                                 |   8 ++
>  package/Config.in                          |   4 +
>  package/cog/Config.in                      |  21 ++++
>  package/cog/cog.hash                       |   5 +
>  package/cog/cog.mk                         |  17 +++
>  package/libwpe/Config.in                   |  13 +++
>  package/libwpe/libwpe.hash                 |   7 ++
>  package/libwpe/libwpe.mk                   |  22 ++++
>  package/wpebackend-fdo/Config.in           |  19 ++++
>  package/wpebackend-fdo/wpebackend-fdo.hash |   7 ++
>  package/wpebackend-fdo/wpebackend-fdo.mk   |  15 +++
>  package/wpewebkit/Config.in                | 114 +++++++++++++++++++++
>  package/wpewebkit/wpewebkit.hash           |   8 ++
>  package/wpewebkit/wpewebkit.mk             |  61 +++++++++++
>  14 files changed, 321 insertions(+)
>  create mode 100644 package/cog/Config.in
>  create mode 100644 package/cog/cog.hash
>  create mode 100644 package/cog/cog.mk
>  create mode 100644 package/libwpe/Config.in
>  create mode 100644 package/libwpe/libwpe.hash
>  create mode 100644 package/libwpe/libwpe.mk
>  create mode 100644 package/wpebackend-fdo/Config.in
>  create mode 100644 package/wpebackend-fdo/wpebackend-fdo.hash
>  create mode 100644 package/wpebackend-fdo/wpebackend-fdo.mk
>  create mode 100644 package/wpewebkit/Config.in
>  create mode 100644 package/wpewebkit/wpewebkit.hash
>  create mode 100644 package/wpewebkit/wpewebkit.mk
> 
> -- 
> 2.17.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190205/463c288f/attachment-0001.asc>
