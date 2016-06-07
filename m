From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Jun 2016 13:27:03 +0200
Subject: [Buildroot] [PATCH 1/4] package/emlog: bump version
In-Reply-To: <1465161963-32681-1-git-send-email-bernd.kuhls@t-online.de>
References: <1465161963-32681-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160607132703.12d94e00@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  5 Jun 2016 23:26:00 +0200, Bernd Kuhls wrote:
> Removed patch applied upstream:
> https://github.com/nicupavel/emlog/commit/576a6c0fcf76dfeff48124b2f5fc0b4207d88ca1
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/emlog/0001-Fix-access-to-the-dentry.patch | 57 -----------------------
>  package/emlog/emlog.hash                          |  2 +-
>  package/emlog/emlog.mk                            |  2 +-
>  3 files changed, 2 insertions(+), 59 deletions(-)
>  delete mode 100644 package/emlog/0001-Fix-access-to-the-dentry.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
