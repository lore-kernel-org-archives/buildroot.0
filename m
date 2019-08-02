From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 2 Aug 2019 18:46:10 +0200
Subject: [Buildroot] [PATCH] python-matplotlib: needs a toolchain with
 C++ support
In-Reply-To: <20190802162226.15556-1-peter@korsgaard.com>
References: <20190802162226.15556-1-peter@korsgaard.com>
Message-ID: <20190802184610.3e9657aa@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

The commit title should start with package/python-matplotlib :-)

On Fri,  2 Aug 2019 18:22:26 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> Matplotlib contains .cpp source code:
> 
> ls src/*.cpp
> src/_backend_agg.cpp
> src/_backend_agg_wrapper.cpp
> src/_contour.cpp
> src/_contour_wrapper.cpp
> src/ft2font.cpp
> src/ft2font_wrapper.cpp
> src/_image.cpp
> src/_image_wrapper.cpp
> src/mplutils.cpp
> src/_path_wrapper.cpp
> src/_png.cpp
> src/py_converters.cpp
> src/_tkagg.cpp
> src/_ttconv.cpp
> src/_windowing.cpp
> 
> So add a dependency on C++ support in the toolchain to fix build errors like
> (no autobuilder reference yet):

Since when does it need C++ ? Was this package bumped recently ? If
not, why don't we have autobuilder failures for this ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
