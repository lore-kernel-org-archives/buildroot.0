From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 May 2020 23:05:34 +0200
Subject: [Buildroot] [PATCH] package/zziplib: bump to version 0.13.71
In-Reply-To: <20200504145212.3205471-1-romain.naour@gmail.com>
References: <20200504145212.3205471-1-romain.naour@gmail.com>
Message-ID: <20200505230534.6ea3d695@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  4 May 2020 16:52:12 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> Remove upstream patches and CVE tags.
> 
> Switch the dependency to python3 added by [1].
> 
> Update indentation of hash file (two spaces).
> 
> [1] https://github.com/gdraheim/zziplib/commit/a144bec8d06302e7be11f0f46e02947b0becf574
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  ...eak-from-__zzip_parse_root_directory.patch |  74 ----
>  ...k-from-__zzip_parse_root_directory-2.patch |  53 ---
>  ...3-One-more-free-to-avoid-memory-leak.patch |  25 --
>  ...omponents-from-pathnames-of-extracte.patch | 344 ------------------
>  package/zziplib/zziplib.hash                  |   8 +-
>  package/zziplib/zziplib.mk                    |  15 +-
>  6 files changed, 7 insertions(+), 512 deletions(-)
>  delete mode 100644 package/zziplib/0001-Avoid-memory-leak-from-__zzip_parse_root_directory.patch
>  delete mode 100644 package/zziplib/0002-Avoid-memory-leak-from-__zzip_parse_root_directory-2.patch
>  delete mode 100644 package/zziplib/0003-One-more-free-to-avoid-memory-leak.patch
>  delete mode 100644 package/zziplib/0004-Fix-issue-62-Remove-any-components-from-pathnames-of-extracte.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
