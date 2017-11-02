From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Nov 2017 14:18:25 +0100
Subject: [Buildroot] [PATCH 4/4] package/ussp-push: removed
 deprecated/no longer needed deps on openobex-bluez
In-Reply-To: <20171101201137.29939-4-s.martin49@gmail.com>
References: <20171101201137.29939-1-s.martin49@gmail.com>
 <20171101201137.29939-4-s.martin49@gmail.com>
Message-ID: <20171102141825.66665f98@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  1 Nov 2017 21:11:37 +0100, Samuel Martin wrote:
> Commit 49a9fb0f13789298e65f21405502a9106e2c7382 deprecates the
> BR2_PACKAGE_OPENOBEX_BLUEZ option, which should be turned in
> BR2_PACKAGE_BLUEZ_UTILS instead.

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
