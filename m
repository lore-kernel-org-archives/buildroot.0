From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Apr 2017 14:47:05 +0200
Subject: [Buildroot] [PATCH] xorriso: Bump version to 1.4.6,
 drop patch applied upstream
In-Reply-To: <1490962583-32555-1-git-send-email-benoit.allard@greenbone.net>
References: <1490962583-32555-1-git-send-email-benoit.allard@greenbone.net>
Message-ID: <20170401144705.2fd2a108@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 31 Mar 2017 14:16:23 +0200, Beno?t Allard wrote:
> Signed-off-by: Beno?t Allard <benoit.allard@greenbone.net>
> ---
>  package/xorriso/0001-fix-musl-build.patch | 20 --------------------
>  package/xorriso/xorriso.hash              |  2 +-
>  package/xorriso/xorriso.mk                |  2 +-
>  3 files changed, 2 insertions(+), 22 deletions(-)
>  delete mode 100644 package/xorriso/0001-fix-musl-build.patch

Applied to master, after slightly tweaking the commit log. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
