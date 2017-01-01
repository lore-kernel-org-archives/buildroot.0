From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 Jan 2017 09:18:40 +0100
Subject: [Buildroot] [PATCH] package/intltool: remove target variant
In-Reply-To: <20161231153328.10960-1-romain.naour@gmail.com>
References: <20161231153328.10960-1-romain.naour@gmail.com>
Message-ID: <20170101091840.7da70b8d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 31 Dec 2016 16:33:28 +0100, Romain Naour wrote:
> The target variant depends on BR2_HOST_ONLY which is just like BROKEN
> (i.e not defined anywere). BR2_HOST_ONLY was introduced by [1] back in
> 2010 and nobody seems to need it. So remove intltool for the target.
> 
> [1] 0b876d39776fdec69762b988216e5ed64dbe6ba8
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/Config.in            | 1 -
>  package/intltool/Config.in   | 9 ---------
>  package/intltool/intltool.mk | 1 -
>  3 files changed, 11 deletions(-)
>  delete mode 100644 package/intltool/Config.in

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
