From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 May 2016 15:18:27 +0200
Subject: [Buildroot] [PATCH 1/1] package/freeswitch: bump version to
 1.6.8
In-Reply-To: <1462624756-5887-1-git-send-email-bernd.kuhls@t-online.de>
References: <1462624756-5887-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160508151827.2cae1230@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  7 May 2016 14:39:16 +0200, Bernd Kuhls wrote:
> Removed patches applied upstream:
> https://freeswitch.org/stash/projects/FS/repos/freeswitch/commits/eadb3f890f6e7ba3b3ca23c6feb144fb35d304ce
> https://freeswitch.org/stash/projects/FS/repos/freeswitch/commits/b024c752fb2e9789fdbaf769be9998f62bb5c483
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/freeswitch/0001-zrtp.patch                 | 33 --------------------
>  .../0002-mod_cv-remove-unneeded-includes.patch     | 36 ----------------------
>  package/freeswitch/freeswitch.hash                 |  4 +--
>  package/freeswitch/freeswitch.mk                   |  2 +-
>  4 files changed, 3 insertions(+), 72 deletions(-)
>  delete mode 100644 package/freeswitch/0001-zrtp.patch
>  delete mode 100644 package/freeswitch/0002-mod_cv-remove-unneeded-includes.patch

Applied to master, thanks. Great to see some patches being merged
upstream and getting removed from Buildroot.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
