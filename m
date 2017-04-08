From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Apr 2017 17:00:17 +0200
Subject: [Buildroot] [PATCH] pkg-python: ignore user site-packages
 directory
In-Reply-To: <20170406184608.22111-1-yegorslists@googlemail.com>
References: <20170406184608.22111-1-yegorslists@googlemail.com>
Message-ID: <20170408170017.609794d0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  6 Apr 2017 20:46:08 +0200, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> According to PEP 370 Python will also search for the packages in the
> user site-packages directory. This can affect build reproducibility.
> 
> The solution is to use PYTHONNOUSERSITE=1 for all Python packages,
> i.e. both host and target variants.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/pkg-python.mk | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
