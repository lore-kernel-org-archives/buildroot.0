From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 24 Jun 2017 12:07:44 +0200
Subject: [Buildroot] [PATCH] libgpiod: bump version to v0.3
In-Reply-To: <1498296625-5577-1-git-send-email-brgl@bgdev.pl>
References: <1498296625-5577-1-git-send-email-brgl@bgdev.pl>
Message-ID: <20170624120744.4edf6fcd@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 24 Jun 2017 11:30:25 +0200, Bartosz Golaszewski wrote:
> Add host-pkgconf to dependencies as we now use PKG_CHECK_MODULES in
> configure.ac.
> 
> Changelog for v0.3:
> 
> New features:
> - gpiomon can now watch multiple lines at the same time and supports custom
>   output formats which can be specified using the --format argument
> - testing framework can now test external programs: test cases for gpio-tools
>   have been added
> 
> Improvements:
> - improve error messages
> - improve README examples
> - configure script improvements
> 
> Bug fixes:
> - use correct UAPI flags when requesting line events
> 
> Also includes bug fixes from v0.2.1:
> 
> Bug fixes:
> - capitalize 'GPIO' in error messages in gpioset, gpioget & gpiomon
> - tweak the error message on invalid arguments in gpiofind
> - don't ignore superfluous arguments and fix the displayed name for falling
>   edge events in gpiomon
> 
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> ---
>  package/libgpiod/libgpiod.hash | 2 +-
>  package/libgpiod/libgpiod.mk   | 4 +++-
>  2 files changed, 4 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
