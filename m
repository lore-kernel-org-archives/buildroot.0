From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Apr 2015 14:30:13 +0200
Subject: [Buildroot] [PATCH 03/19] package/gnuchess: bump version to
 6.2.1
In-Reply-To: <1429453778-4178-3-git-send-email-bernd.kuhls@t-online.de>
References: <1429453778-4178-1-git-send-email-bernd.kuhls@t-online.de>
 <1429453778-4178-3-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150426143013.3430696c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 19 Apr 2015 16:29:22 +0200, Bernd Kuhls wrote:
> Removed unneeded patches, Debian did the same:
> http://metadata.ftp-master.debian.org/changelogs/main/g/gnuchess/unstable_changelog
> 
> gnuchess (6.0.2-1) unstable; urgency=low
> 
>   * New upstream version (Closes: #637722)
> [...]
>     - Drop patches
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/gnuchess/0001-getline-conflicts.patch |   48 -------------------------
>  package/gnuchess/0002-misc-fixes.patch        |   11 ------
>  package/gnuchess/gnuchess.mk                  |    2 +-
>  3 files changed, 1 insertion(+), 60 deletions(-)
>  delete mode 100644 package/gnuchess/0001-getline-conflicts.patch
>  delete mode 100644 package/gnuchess/0002-misc-fixes.patch

Applied after checking why the patch is no longer needed, and adjusting
the commit log accordingly.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
