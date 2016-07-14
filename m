From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 14 Jul 2016 12:32:58 +0200
Subject: [Buildroot] [PATCH] cmake: bump version to 3.6.0
In-Reply-To: <1468490810-62781-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1468490810-62781-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20160714123258.08707c8d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 14 Jul 2016 11:06:50 +0100, Vicente Olivert Riera wrote:

> diff --git a/package/cmake/0001-rename_cmake_rootfile.patch b/package/cmake/0001-rename_cmake_rootfile.patch
> index 915b7e3..e76f9cd 100644
> --- a/package/cmake/0001-rename_cmake_rootfile.patch
> +++ b/package/cmake/0001-rename_cmake_rootfile.patch
> @@ -5,19 +5,25 @@ files are removed at build time via the target-finalize rule.
>  This buildroot-specific patch makes sure ctest looks also for
>  "Modules/CMake.cmake.ctest" before complaining
>  
> +[Vincent: tweak patch for 3.6.0]

This normally goes...

> +
>  Signed-off-by: Davide Viti <zinosat@tiscali.it>

.... here.

So I've changed that and applied.

> +Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
