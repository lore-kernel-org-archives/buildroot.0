From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Apr 2014 14:10:08 +0200
Subject: [Buildroot] [PATCH] libevdev: adjust host-python dependency
In-Reply-To: <1396784186-13541-1-git-send-email-s.martin49@gmail.com>
References: <1396784186-13541-1-git-send-email-s.martin49@gmail.com>
Message-ID: <20140406141008.4edd66cd@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Sun,  6 Apr 2014 13:36:26 +0200, Samuel Martin wrote:
> libevdev depends on host-python because of some of its build scripts.
> These build scripts support python2 and python3.
> 
> When python3 is part of the target selection, then we can just use the
> interpreter provided by the host-python3 package.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/dd0/dd04833b11a0ebb0193c861cb375b2112dd339d1/
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> ---
>  package/libevdev/libevdev.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
