From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 4 Aug 2019 18:52:41 +0200
Subject: [Buildroot] [PATCH] package/glibc: bump version for additional
 post-2.29 fixes
In-Reply-To: <20190804132429.23425-1-peter@korsgaard.com>
References: <20190804132429.23425-1-peter@korsgaard.com>
Message-ID: <20190804185241.4a495cee@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  4 Aug 2019 15:24:29 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> The following additional bugs are fixed:
> 
>   [16573] malloc: Set and reset all hooks for tracing
>   [18035] Fix pldd hang
>   [20568] Fix crash in _IO_wfile_sync
>   [24228] old x86 applications that use legacy libio crash on exit
>   [24476] dlfcn: Guard __dlerror_main_freeres with __libc_once_get (once)
>   [24744] io: Remove the copy_file_range emulation
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  .../glibc.hash                                                          | 2 +-
>  package/glibc/glibc.mk                                                  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename package/glibc/{2.29-11-ge28ad442e73b00ae2047d89c8cc7f9b2a0de5436 => 2.29-30-g2d3fefd7ce64ac1015701c96916fffacc073a877}/glibc.hash (70%)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
