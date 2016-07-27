From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Jul 2016 22:47:03 +0200
Subject: [Buildroot] [PATCH v2] stella: new package
In-Reply-To: <1469564991-29029-1-git-send-email-sergio.prado@e-labworks.com>
References: <1469564991-29029-1-git-send-email-sergio.prado@e-labworks.com>
Message-ID: <20160727224703.6b169e0e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 26 Jul 2016 17:29:51 -0300, Sergio Prado wrote:
> Stella is a multi-platform Atari 2600 VCS emulator.
> 
> Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
> ---
> Changes v1 -> v2:
>  - separate patch that prevents striping stella binary when installing
>  - inherit dependency on !BR2_STATIC_LIBS from sdl2
>  - change license to GPLv2+ and add Copyright.txt to license files
>  - unconditionally depends on libpng and zlib
>  - build the package with the generic-package infrastructure
> ---
>  package/Config.in                                  |  1 +
>  .../0001-Add-cross-compilation-support.patch       | 29 +++++++++++++++++
>  .../stella/0002-Do-not-strip-when-installing.patch | 26 ++++++++++++++++
>  package/stella/Config.in                           | 16 ++++++++++
>  package/stella/stella.hash                         |  2 ++
>  package/stella/stella.mk                           | 36 ++++++++++++++++++++++
>  6 files changed, 110 insertions(+)
>  create mode 100644 package/stella/0001-Add-cross-compilation-support.patch
>  create mode 100644 package/stella/0002-Do-not-strip-when-installing.patch
>  create mode 100644 package/stella/Config.in
>  create mode 100644 package/stella/stella.hash
>  create mode 100644 package/stella/stella.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
