From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Jun 2017 14:39:03 +0200
Subject: [Buildroot] [PATCH 1/1] package/mcelog: bump version to 152,
 add hash
In-Reply-To: <20170611080717.17072-1-bernd.kuhls@t-online.de>
References: <20170611080717.17072-1-bernd.kuhls@t-online.de>
Message-ID: <20170611143903.6c9e2786@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 11 Jun 2017 10:07:17 +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...memutil.h-add-missing-include-for-va_list.patch | 31 ++++++++++++++++++++++
>  package/mcelog/mcelog.hash                         |  2 ++
>  package/mcelog/mcelog.mk                           |  2 +-
>  3 files changed, 34 insertions(+), 1 deletion(-)
>  create mode 100644 package/mcelog/0001-memutil.h-add-missing-include-for-va_list.patch
>  create mode 100644 package/mcelog/mcelog.hash

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
