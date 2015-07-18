From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Jul 2015 22:08:50 +0200
Subject: [Buildroot] [PATCH v3] libiio: Bump version to 0.5
In-Reply-To: <1427274037-22340-1-git-send-email-paul.cercueil@analog.com>
References: <1427274037-22340-1-git-send-email-paul.cercueil@analog.com>
Message-ID: <20150718220850.2d9e5e4e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Paul Cercueil,

On Wed, 25 Mar 2015 10:00:37 +0100, Paul Cercueil wrote:
> The package now offers the possibility to install Python and/or C#
> bindings if the Python and Mono packages are detected.
> 
> v2: Patch generated with 'git format-patch -M' and fix indentation in libiio.mk
> v3: Updated libiio.hash file
> 
> Signed-off-by: Paul Cercueil <paul.cercueil@analog.com>
> ---
>  ...UILD_SHARED_LIBS-drive-the-type-of-librar.patch | 29 --------------------
>  ...2-detection-try-first-the-CMake-module-f.patch} |  0
>  package/libiio/Config.in                           | 12 ++++++++
>  package/libiio/libiio.hash                         |  4 +--
>  package/libiio/libiio.mk                           | 32 ++++++++++++++++++++--
>  5 files changed, 43 insertions(+), 34 deletions(-)
>  delete mode 100644 package/libiio/0001-cmake-let-BUILD_SHARED_LIBS-drive-the-type-of-librar.patch
>  rename package/libiio/{0002-cmake-libxml2-detection-try-first-the-CMake-module-f.patch => 0001-cmake-libxml2-detection-try-first-the-CMake-module-f.patch} (100%)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
