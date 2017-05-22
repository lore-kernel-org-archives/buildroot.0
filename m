From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 May 2017 15:58:11 +0200
Subject: [Buildroot] [PATCH/next 1/2] package/alsa-lib: bump version to
 1.1.4
In-Reply-To: <20170521145616.20380-1-bernd.kuhls@t-online.de>
References: <20170521145616.20380-1-bernd.kuhls@t-online.de>
Message-ID: <20170522155811.6e55e939@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 21 May 2017 16:56:15 +0200, Bernd Kuhls wrote:
> Removed patches applied upstream:
> 
> 0005-remove-powerpc64-workaround.patch
> http://git.alsa-project.org/?p=alsa-lib.git;a=commitdiff;h=3bad0a21b4d13d8d10691f382c836897fa7a7cb9
> 
> 0006-ucm-parser-needs-limits.h.patch
> http://git.alsa-project.org/?p=alsa-lib.git;a=commitdiff;h=9ed4075f05a4242f32331f7f2c365767970f5003
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../0005-remove-powerpc64-workaround.patch         | 67 ----------------------
>  .../alsa-lib/0006-ucm-parser-needs-limits.h.patch  | 30 ----------
>  package/alsa-lib/alsa-lib.hash                     |  2 +-
>  package/alsa-lib/alsa-lib.mk                       |  2 +-
>  4 files changed, 2 insertions(+), 99 deletions(-)
>  delete mode 100644 package/alsa-lib/0005-remove-powerpc64-workaround.patch
>  delete mode 100644 package/alsa-lib/0006-ucm-parser-needs-limits.h.patch

Both applied to next. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
