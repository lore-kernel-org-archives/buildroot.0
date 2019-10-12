From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 12 Oct 2019 15:28:27 +0200
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 19.2.1
In-Reply-To: <20191012055846.18308-1-bernd.kuhls@t-online.de>
References: <20191012055846.18308-1-bernd.kuhls@t-online.de>
Message-ID: <20191012152827.74a2b996@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 12 Oct 2019 07:58:46 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Removed 0004-meson-Link-xvmc-with-libxv.patch, applied upstream:
> https://cgit.freedesktop.org/mesa/mesa/commit/?h=19.2&id=2dbf10ba3d129d59e1a6c0e46b24c20629b277c6
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

This patch does not apply: there is no 0004 patch in master on mesa3d.
It would be added by "[PATCH v2 3/4] package/mesa3d: add xlib_libXv
dependency to mesa3d xvmc", which hasn't been applied so far.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
