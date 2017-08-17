From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Aug 2017 09:56:11 +0200
Subject: [Buildroot] [PATCH 1/1] package/librsync: fix build error with
 gcc7
In-Reply-To: <20170817041230.14468-1-bernd.kuhls@t-online.de>
References: <20170817041230.14468-1-bernd.kuhls@t-online.de>
Message-ID: <20170817095611.5ff2f64b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 17 Aug 2017 06:12:30 +0200, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/4a1/4a1931565674442c6117b2b202a002dd0ec12a4b/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> For the next branch we should bump the package to 2.0.0 which includes
> this fix and switches the build system to cmake.

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
