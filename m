From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Aug 2016 00:05:12 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/x11r7/xserver_xorg-server:
 needs dri/dri2/dri3 for libdrm support
In-Reply-To: <1470585874-15428-1-git-send-email-bernd.kuhls@t-online.de>
References: <1470585874-15428-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160811000512.186a9343@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  7 Aug 2016 18:04:34 +0200, Bernd Kuhls wrote:
> Rework dependency handling as pointed out by Thomas:
> http://lists.busybox.net/pipermail/buildroot/2016-July/168433.html
> 
> Fixes
> http://autobuild.buildroot.net/results/2d3/2d38637e7904f3e382e41745a82ee1a1cf19ba71/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Could you verify if this issue still exists? Indeed, since the bump
from 1.18.3 to 1.18.4 of the X.org server, we were missing one patch.
See my commit:

  https://git.buildroot.org/buildroot/commit/?id=3686101a2ae9ec37b4d34a368db03c325f7f92e3

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
