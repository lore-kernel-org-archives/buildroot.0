From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Apr 2018 17:42:00 +0200
Subject: [Buildroot] [PATCH 1/1] libcue: fix build without C++
In-Reply-To: <20180430111511.6881-1-fontaine.fabrice@gmail.com>
References: <20180430111511.6881-1-fontaine.fabrice@gmail.com>
Message-ID: <20180430174200.4fb82988@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 30 Apr 2018 13:15:11 +0200, Fabrice Fontaine wrote:
> By default, CMake assumes that the project is using both C and C++. By
> explicitly passing 'C' as argument of the project() macro, we tell
> CMake that only C is used, which prevents CMake from checking if a C++
> compiler exists.
> Patch sent upstream: https://github.com/lipnitsk/libcue/pull/17
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/a5344d18dbdc86705853fbf8a66d5304de07a9b2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-libcue-is-only-implemented-in-C.patch     | 34 ++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 package/libcue/0001-libcue-is-only-implemented-in-C.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
