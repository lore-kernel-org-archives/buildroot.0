From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Jan 2016 08:35:05 +0100
Subject: [Buildroot] [PATCH 1/1] package/libev: bump version to 4.22
In-Reply-To: <1454104382-13959-1-git-send-email-bernd.kuhls@t-online.de>
References: <1454104382-13959-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160130083505.6f6c273f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Fri, 29 Jan 2016 22:53:02 +0100, Bernd Kuhls wrote:
> This patch also fixes the broken download of version 4.19 because
> upstream move the archive file to Attic/
> 
> Removed patch after upstream applied a similar fix:
> http://cvs.schmorp.de/libev/ev.c?r1=1.476&r2=1.477
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/libev/0001-fix-sparcv8-condition.patch | 29 --------------------------
>  package/libev/libev.hash                       |  2 +-
>  package/libev/libev.mk                         |  2 +-
>  3 files changed, 2 insertions(+), 31 deletions(-)
>  delete mode 100644 package/libev/0001-fix-sparcv8-condition.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
