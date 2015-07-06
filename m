From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Jul 2015 14:27:50 +0200
Subject: [Buildroot] [PATCH] package:sysdig: bump to version 0.1.100
In-Reply-To: <1432625654-16560-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1432625654-16560-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20150706142750.2e4590b2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Angelo Compagnucci,

On Tue, 26 May 2015 09:34:14 +0200, Angelo Compagnucci wrote:
> This patch bumps to version 0.1.100, removes the no more
> neded upstream included patch and adds the ENABLE_DKMS=OFF
> configure option.
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> ---
>  .../sysdig/0001-remove-dkms-module-updater.patch   | 31 ----------------------
>  package/sysdig/sysdig.mk                           |  4 +--
>  2 files changed, 2 insertions(+), 33 deletions(-)
>  delete mode 100644 package/sysdig/0001-remove-dkms-module-updater.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
