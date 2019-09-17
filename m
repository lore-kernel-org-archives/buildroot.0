From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 17 Sep 2019 22:00:16 +0200
Subject: [Buildroot] [PATCH 1/2] package/libglib2: bump to version 2.62.0
In-Reply-To: <20190916191605.86764-1-aduskett@gmail.com>
References: <20190916191605.86764-1-aduskett@gmail.com>
Message-ID: <20190917220016.3d276b03@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 16 Sep 2019 12:16:04 -0700
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> Other changes:
>  - Refactor 0002-add-option-to-build-tests.patch to work with the new version.
>  - Add the new option oss_fuzz=disabled to HOST_LIBGLIB2_CONF_OPTS and
>    LIBGLIB2_CONF_OPTS.
>  - Change -Diconv=gnu to -Diconv=external as the option has changed.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  ...01-fix-compile-time-atomic-detection.patch |  2 +-
>  .../0002-add-option-to-build-tests.patch      | 94 +++++++------------
>  .../0003-remove-cpp-requirement.patch         | 30 +++---
>  ...mat-nonliteral-to-compiler-arguments.patch |  2 +-
>  package/libglib2/libglib2.hash                |  2 +-
>  package/libglib2/libglib2.mk                  | 12 ++-
>  6 files changed, 60 insertions(+), 82 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
