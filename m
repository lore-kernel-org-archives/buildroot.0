From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Feb 2017 17:42:03 +0100
Subject: [Buildroot] [PATCH 1/2] logrotate: bump to version 3.11.0
In-Reply-To: <20170207140411.2656-1-Adamduskett@outlook.com>
References: <20170207140411.2656-1-Adamduskett@outlook.com>
Message-ID: <20170207174203.5310fca8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  7 Feb 2017 09:04:10 -0500, Adam Duskett wrote:
> Also removed both patches as they have been added to this release.
> Aslo removed reference to github patch in makefile as it has been
> added to this release as well.
> 
> Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
> ---
>  package/logrotate/0001-make-autoreconfable.patch   | 20 -------
>  ...-autoconf-checks-for-strndup-and-asprintf.patch | 61 ----------------------
>  package/logrotate/logrotate.hash                   |  3 +-
>  package/logrotate/logrotate.mk                     |  3 +-
>  4 files changed, 2 insertions(+), 85 deletions(-)
>  delete mode 100644 package/logrotate/0001-make-autoreconfable.patch
>  delete mode 100644 package/logrotate/0002-Use-autoconf-checks-for-strndup-and-asprintf.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
