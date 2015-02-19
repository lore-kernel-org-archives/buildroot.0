From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Feb 2015 22:25:22 +0100
Subject: [Buildroot] [PATCH] netsnmp: Set ac_cv_NETSNMP_CAN_USE_SYSCTL
 to no
In-Reply-To: <1424187731-417-1-git-send-email-stefan.sorensen@spectralink.com>
References: <1424187731-417-1-git-send-email-stefan.sorensen@spectralink.com>
Message-ID: <20150219222522.011d40bc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Stefan S?rensen,

On Tue, 17 Feb 2015 16:42:11 +0100, Stefan S?rensen wrote:
> NETSNMP_CAN_USE_SYSCTL is for BSD systems, setting it to yes on
> Linux systems breaks compilation when the mibII mib is enabled.
> 
> Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>

I've extended a bit the commit log, and applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
