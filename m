From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Jul 2015 17:18:35 +0200
Subject: [Buildroot] [PATCH 1/2] audit: version bump
In-Reply-To: <1437576676-16816-1-git-send-email-clayton.shotwell@rockwellcollins.com>
References: <1437576676-16816-1-git-send-email-clayton.shotwell@rockwellcollins.com>
Message-ID: <20150722171835.352e4219@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Clayton Shotwell,

On Wed, 22 Jul 2015 09:51:15 -0500, Clayton Shotwell wrote:
> Bumping from version 2.4.1 to 2.4.3 to drop patches that have been
> picked up by the mainline.
> 
> Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
> ---
>  package/audit/0001-Enable-cross-compiling.patch    | 686 ---------------------
>  .../0002-Make-zos-remote-plugin-optional.patch     |  56 --
>  ...03-Default-ADDR_NO_RANDOMIZE-if-not-found.patch |  44 --
>  ...o-not-call-posix_fallocate-if-unavailable.patch |  47 --
>  ...Fix-header-detection-when-cross-compiling.patch |  46 --
>  package/audit/audit.hash                           |   2 +-
>  package/audit/audit.mk                             |   4 +-
>  7 files changed, 3 insertions(+), 882 deletions(-)
>  delete mode 100644 package/audit/0001-Enable-cross-compiling.patch
>  delete mode 100644 package/audit/0002-Make-zos-remote-plugin-optional.patch
>  delete mode 100644 package/audit/0003-Default-ADDR_NO_RANDOMIZE-if-not-found.patch
>  delete mode 100644 package/audit/0004-Do-not-call-posix_fallocate-if-unavailable.patch
>  delete mode 100644 package/audit/0005-Fix-header-detection-when-cross-compiling.patch

Both patches applied. It's really great to see your patches being
merged upstream. Definitely gives confidence in your SELinux
involvement, and therefore in applying the remaining patches.

It is a bit sad that your second patch essentially re-adds something
pretty much as large as the "Enable cross compiling" patch that you're
removing in this first patch. But it's heading in the right
direction :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
