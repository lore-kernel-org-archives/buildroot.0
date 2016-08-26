From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Aug 2016 11:00:08 +0200
Subject: [Buildroot] [PATCH] board: add support for ZII VF610
 Development Board
In-Reply-To: <20160825190022.8461-1-vivien.didelot@savoirfairelinux.com>
References: <20160825190022.8461-1-vivien.didelot@savoirfairelinux.com>
Message-ID: <20160826110008.53f339a6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 25 Aug 2016 15:00:22 -0400, Vivien Didelot wrote:
> Add support for the Rev. B of a Zodiac Inflight Innovations development
> board, mainly intended for DSA and ARINC 429 development work.
> 
> Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>

Is this board publicly available?

Your patch looks good and perfectly matches the Buildroot way of having
minimal defconfigs. But if the board is not publicly available, I'm not
sure we want a defconfig for it in Buildroot.

Also, we generally add a readme.txt that explains how to use the
defconfig result (how to flash it and use it on the board), and this
file often includes a link to a webpage with more details about the
board.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
