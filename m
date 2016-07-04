From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Jul 2016 11:42:29 +0200
Subject: [Buildroot] [PATCH 1/2] Package nfs-utils: Start/stop daemons
 consistently
In-Reply-To: <1467564419-21313-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1467564419-21313-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20160704114229.5f5e9ea8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  3 Jul 2016 18:46:58 +0200, Maxime Hadjinlian wrote:
> From: universe II <universeii@gmx.de>
> 
> Changed init script to start and stop all nfs daemons
> in a consistent way. Using the same kill command,
> start/stop the daemon, printout OK or FAIL and touch
> or deleted necessary files.
> 
> Signed-off-by: Andreas Ehmanns <universeII@gmx.de>
> [Maxime:
>    - Make it really consistent to stop the daemons as pointed out by Yann E. Morin
>    - Remove the -9]
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  package/nfs-utils/S60nfs | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

Both applied, with minor tweaks. Regarding the second patch, I really
wasn't sure since we don't have written rules about indentation in our
init scripts, it's the kind of things that tends to get changed in one
direction, and then in the other direction a few months later. But
anyway, since the patch was done, I applied it.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
