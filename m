From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Feb 2017 09:36:34 +0100
Subject: [Buildroot] [PATCH v1 1/2] qt5base: use system/buildroot
 provided freetype
In-Reply-To: <20170209223055.31121-1-ps.report@gmx.net>
References: <20170209223055.31121-1-ps.report@gmx.net>
Message-ID: <20170210093634.68f43e26@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  9 Feb 2017 23:30:54 +0100, Peter Seiderer wrote:
> Fixes [1]:
> 
>   Project ERROR: Library 'libpng' is not defined.
>   make[3]: *** [sub-3rdparty-freetype-make_first] Error 3
> 
> [1] http://autobuild.buildroot.net/results/219162ba616289f799a5053c4dcc6b8574284283
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

So since Qt 5.8, both freetype and harfbuzz are mandatory for the GUI
support ?

Should we make these additional dependencies only exist for the Qt
latest version (they were not needed for Qt 5.6) ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
