From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 10:30:55 +0200
Subject: [Buildroot] [PATCH] package/tinyxml2: Bump version
In-Reply-To: <1467472618-3612-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1467472618-3612-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20160703103055.2fd28db9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  2 Jul 2016 17:16:58 +0200, Maxime Hadjinlian wrote:
> Remove patches as they were applied upstream:
> 
> 0001-Use-BUILD_SHARED_LIBS-cmake-standard.patch
> https://github.com/leethomason/tinyxml2/commit/c8ec6fcab4eb501cc5bd328c19dcbd4b30722d52
> 
> 0002-Rename-test-fixed-cmake-warning.patch
> https://github.com/leethomason/tinyxml2/commit/0b2c22bd46be95b08f234b8b4cb262f72ab3f0e8
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  ...0001-Use-BUILD_SHARED_LIBS-cmake-standard.patch | 65 ----------------------
>  .../0002-Rename-test-fixed-cmake-warning.patch     | 38 -------------
>  package/tinyxml2/tinyxml2.hash                     |  2 +-
>  package/tinyxml2/tinyxml2.mk                       |  2 +-
>  4 files changed, 2 insertions(+), 105 deletions(-)
>  delete mode 100644 package/tinyxml2/0001-Use-BUILD_SHARED_LIBS-cmake-standard.patch
>  delete mode 100644 package/tinyxml2/0002-Rename-test-fixed-cmake-warning.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
