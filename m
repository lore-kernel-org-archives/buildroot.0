From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Nov 2016 13:40:51 +0100
Subject: [Buildroot] [PATCH] systemd: bump version to 232
In-Reply-To: <20161104103213.26968-1-Vincent.Riera@imgtec.com>
References: <20161104103213.26968-1-Vincent.Riera@imgtec.com>
Message-ID: <20161105134051.2d492380@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 4 Nov 2016 10:32:13 +0000, Vicente Olivert Riera wrote:
> - 0002 patch tweaked. There is a hunk that has been removed upstream by
>   this commit:
>   https://github.com/systemd/systemd/commit/082210c7a837063fd8b520b18c221b42059d7eff
> - Patches 0004, 0005 and 0006 were backported from upstream and now they
>   are included in this release, so drop them.
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  ...uild-sys-revert-use-of-ln-relative-option.patch | 18 +++---
>  ...-export-raw-needs-missing.h-for-O_TMPFILE.patch | 31 -----------
>  ...h-add-missing-definitions-for-__O_TMPFILE.patch | 63 ---------------------
>  ...basic-fileio-we-always-have-O_TMPFILE-now.patch | 65 ----------------------
>  package/systemd/systemd.hash                       |  2 +-
>  package/systemd/systemd.mk                         |  2 +-
>  6 files changed, 9 insertions(+), 172 deletions(-)
>  delete mode 100644 package/systemd/0004-importd-export-raw-needs-missing.h-for-O_TMPFILE.patch
>  delete mode 100644 package/systemd/0005-missing.h-add-missing-definitions-for-__O_TMPFILE.patch
>  delete mode 100644 package/systemd/0006-basic-fileio-we-always-have-O_TMPFILE-now.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
