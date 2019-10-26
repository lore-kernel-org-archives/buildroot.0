From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Oct 2019 20:09:32 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/leveldb: bump version to 1.22
In-Reply-To: <20191012125943.6749-1-bernd.kuhls@t-online.de>
References: <20191012125943.6749-1-bernd.kuhls@t-online.de>
Message-ID: <20191026200932.3834f730@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 12 Oct 2019 14:59:43 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Upstream switched to cmake, removed patches for the old buildsystem
> and added new patch to install libmemenv.a and memenv.h.
> 
> Added license hash.
> 
> Package requires gcc >= 4.8:
> https://github.com/google/leveldb/blob/master/CMakeLists.txt#L14
> 
> Removed "v" from LEVELDB_SITE to reflect current naming scheme.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: added patch to CMake build system to build/install
>     libmemenv.a and memenv.h (Thomas)
>     Patch not sent upstream due to
>     https://github.com/google/leveldb/issues/236#issuecomment-398199946

This new version of leveldb is causing some build failures:
http://autobuild.buildroot.net/?reason=leveldb-1.22. Could you have a
look ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
