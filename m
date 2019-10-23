From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 23 Oct 2019 17:54:12 +0200
Subject: [Buildroot] [PATCH 4/4] package/libnss: remove
 NSS_ENABLE_WERROR=0
In-Reply-To: <20191023102330.20842-4-giulio.benetti@benettiengineering.com>
References: <20191023102330.20842-1-giulio.benetti@benettiengineering.com>
 <20191023102330.20842-4-giulio.benetti@benettiengineering.com>
Message-ID: <20191023175412.60404790@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 23 Oct 2019 12:23:30 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> All warnings have been fixed now, so let's remove NSS_ENABLE_WERROR and
> leave any warning to show up.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

No, we generally don't want to enable -Werror in Buildroot builds, as
warnings keep popping up when upgrading gcc versions.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
