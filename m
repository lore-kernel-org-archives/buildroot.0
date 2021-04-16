From: Maxim Kochetkov <fido_max@inbox.ru>
Date: Fri, 16 Apr 2021 10:15:45 +0300
Subject: [Buildroot] [PATCH v3 2/3] package/libosmium: new package
In-Reply-To: <a735cf9d-33d9-cf32-19e7-a5e2df0f53a2@mind.be>
References: <20210415150356.775904-1-fido_max@inbox.ru>
 <20210415150356.775904-2-fido_max@inbox.ru>
 <a735cf9d-33d9-cf32-19e7-a5e2df0f53a2@mind.be>
Message-ID: <f98d66b6-401b-51c6-3205-ec685102f3ad@inbox.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is header-only library. It only checks some externals headers. All 
dependencies except protozero are optional.

15.04.2021 23:24, Arnout Vandecappelle ?????:
> 
>   So it seems that the dependencies on protozero, gdal, geos, proj and sparsehash
> are not optional. And in fact, the bzip2, zlib, expat dependencies are also not
> optional, if I read cmake/FindOsmium.cmake correctly.
> 
>   Also I can't find sparsehash in buildroot, so how did you manage to build this?
