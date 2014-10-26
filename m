From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Oct 2014 17:08:03 +0100
Subject: [Buildroot] [PATCH 00/15] CMake janitor
In-Reply-To: <1413741891-30113-1-git-send-email-s.martin49@gmail.com>
References: <1413741891-30113-1-git-send-email-s.martin49@gmail.com>
Message-ID: <20141026170803.5758b2f7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Sun, 19 Oct 2014 20:04:36 +0200, Samuel Martin wrote:

> Samuel Martin (15):
>   package/pkg-cmake.mk: globally disable doc, examples and tests
>   package/pkg-cmake.mk: disable colouring the output
>   package/clapack: cleanup configure options
>   package/flann: cleanup configure options
>   package/libsoxr: cleanup configure options

All applied.

>   package/libsoxr: cleanup configure options

Applied after removing the entire BUILD_SHARED_LIBS option.

>   package/libubox: cleanup dependencies
>   package/libubox: cleanup configure options
>   package/libubox: cleanup configure options
>   package/libuci: cleanup configure options
>   package/libuci: cleanup configure options

All applied.

>   package/ne10: cleanup configure options

Rejected, as it doesn't make sense: the ne10 option to disable shared
libraries is specific, and is not the one passed by the CMake package
infra.

>   package/opencv: cleanup configure options
>   package/polarssl: cleanup configure options
>   docs/manual: update cmake-package infrastructure section

All applied.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
