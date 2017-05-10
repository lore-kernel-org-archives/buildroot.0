From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 May 2017 23:46:00 +0200
Subject: [Buildroot] [PATCH] libgpiod: bump version to 0.2
In-Reply-To: <1494433558-5480-1-git-send-email-brgl@bgdev.pl>
References: <1494433558-5480-1-git-send-email-brgl@bgdev.pl>
Message-ID: <20170510234600.28e5f59b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 10 May 2017 18:25:58 +0200, Bartosz Golaszewski wrote:
> New release adds a couple new features and improvements, although the
> most important one - the test suite - doesn't really matter for
> buildroot.
> 
> The project has also been relicensed under LGPLv2.1.
> 
> We need the m4 directory fixup now since the AC_CONFIG_MACRO_DIRS([m4])
> macro was used in configure.ac, but we don't want to have unnecessary
> files in the git repo.
> 
> New features:
> - relicensed under LGPLv2.1
> - implemented a unit testing framework together with a comprehensive
>   set of test cases
> - added a non-closing variant of the gpiochip iterator and foreach
>   macro [by Clemens Gruber]
> - added gpiod_chip_open_by_label()
> 
> Improvements:
> - Makefiles & build commands have been reworked [by Thierry Reding]
> - documentation updates
> - code shrinkage here and there
> - coding style fixes
> - removed all designated initializers from the header for better standards
>   compliance
> 
> Bug fixes:
> - fix the return value of gpiod_simple_event_loop()
> - don't try to process docs if doxygen is not installed
> 
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> ---
>  package/libgpiod/libgpiod.hash |  2 +-
>  package/libgpiod/libgpiod.mk   | 11 +++++++++--
>  2 files changed, 10 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
