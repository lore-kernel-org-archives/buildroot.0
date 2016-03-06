From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Mar 2016 15:59:19 +0100
Subject: [Buildroot] [PATCH v3] libwebsockets : bump to v1.7.3
In-Reply-To: <1456954540-12119-1-git-send-email-sagaert.johan@proximus.be>
References: <1456954540-12119-1-git-send-email-sagaert.johan@proximus.be>
Message-ID: <20160306155919.2c634d88@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sagaert Johan,

On Wed,  2 Mar 2016 22:35:40 +0100, Sagaert Johan wrote:
> drop patch : CMakeLists.txt has been reworked
> static build is now fixed by using the correct
> LIBWEBSOCKETS_CONF_OPTS
> 
> add support for  optional libev and libuv
> used github for download
> updated hash
> 
> Signed-off-by: Sagaert Johan <sagaert.johan@proximus.be>
> ---
> v1 -> v2 add comment on dropping the patch.
> v2 -> v3 moved to v1.73 add the correct CONF_OPTS
> 		for static / shared builds
> 		since both builds are ON by default we
> 		only need to turn off the unneeded one.
> ---
>  ...le-shared-library-build-when-BUILD_SHARED.patch | 107 ---------------------
>  package/libwebsockets/libwebsockets.hash           |   2 +-
>  package/libwebsockets/libwebsockets.mk             |  27 +++++-
>  3 files changed, 25 insertions(+), 111 deletions(-)
>  delete mode 100644 package/libwebsockets/0001-cmake-disable-shared-library-build-when-BUILD_SHARED.patch

I've slightly improved the commit log, and applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
