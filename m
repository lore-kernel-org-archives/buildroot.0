From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 11:36:22 +0200
Subject: [Buildroot] [PATCH v2] libzip: depend on !BR2_STATIC_LIBS
In-Reply-To: <1499241380-1707-1-git-send-email-brgl@bgdev.pl>
References: <1499241380-1707-1-git-send-email-brgl@bgdev.pl>
Message-ID: <20170705113622.264ef251@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  5 Jul 2017 09:56:20 +0200, Bartosz Golaszewski wrote:
> Since version 1.2.0 libzip requires dynamic library capabilities. Add
> it to Config.in and propagate this dependency to packages selecting
> libzip.
> 
> Fixes: http://autobuild.buildroot.net/results/c50/c50ffa5bf565e75333192edc89e2d39044d07f26/
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> ---
> v1->v2:
> - added comments explaining the !BR2_STATIC_LIBS dependency
> - propagated the dependency to packages selecting libzip

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
