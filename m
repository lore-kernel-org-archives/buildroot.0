From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 May 2017 22:04:16 +0200
Subject: [Buildroot] [PATCH] package/bluez_utils: select
 BR2_PACKAGE_CHECK
In-Reply-To: <20170514195518.9038-1-romain.naour@gmail.com>
References: <20170514195518.9038-1-romain.naour@gmail.com>
Message-ID: <20170514220416.3cfe681a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 14 May 2017 21:55:18 +0200, Romain Naour wrote:
> Commit [1] added check package to bluez_utils dependencies without
> selecting it at Kconfig level.
> 
> Fixes:
> Makefile:535: *** check is in the dependency chain of bluez_utils that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.
> 
> [1] 8554be9f82301282161cf6310bacdb6067fefb16
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/bluez_utils/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
