From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 May 2016 14:30:18 +0200
Subject: [Buildroot] [PATCH 1/2] bluez5_utils: bump to version 5.39
In-Reply-To: <1462559419-20212-1-git-send-email-mike@mikebwilliams.com>
References: <1462559419-20212-1-git-send-email-mike@mikebwilliams.com>
Message-ID: <20160507143018.58fba5d8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  6 May 2016 14:30:18 -0400, Mike Williams wrote:
> Drop upstreamed patch
> 
> Signed-off-by: Mike Williams <mike@mikebwilliams.com>
> ---
>  .../0001-tools-avinfo-Fix-big-endian-build.patch   | 39 ----------------------
>  package/bluez5_utils/bluez5_utils.hash             |  2 +-
>  package/bluez5_utils/bluez5_utils.mk               |  2 +-
>  3 files changed, 2 insertions(+), 41 deletions(-)
>  delete mode 100644 package/bluez5_utils/0001-tools-avinfo-Fix-big-endian-build.patch

Both patches applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
