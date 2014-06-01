From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 Jun 2014 13:06:51 +0200
Subject: [Buildroot] [PATCH v4 07/11] pkg-cmake.mk: globally drive the
 CMAKE_BUILD_TYPE flag using BR2_ENABLE_DEBUG
In-Reply-To: <1401614673-3703-8-git-send-email-s.martin49@gmail.com>
References: <1401614673-3703-1-git-send-email-s.martin49@gmail.com>
 <1401614673-3703-8-git-send-email-s.martin49@gmail.com>
Message-ID: <20140601130651.6d413a98@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Sun,  1 Jun 2014 11:24:29 +0200, Samuel Martin wrote:
> This CMake flag is usually used to adjust compiler flags (like: -Ox, -g,
> etc).
> 
> So, it makes sense for Buildroot to globally drive this CMake flags in
> the cmake-package infrastructure.
> 
> However, if a package prefer overriding this default setting, it still
> can via the <PKG>_CONF_OPT variable.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Tested-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
