From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Sep 2016 20:52:31 +0200
Subject: [Buildroot] [PATCH 2/2] python-daemon: add missing dependencies
In-Reply-To: <20160921134044.29040-2-yegorslists@googlemail.com>
References: <20160921134044.29040-1-yegorslists@googlemail.com>
 <20160921134044.29040-2-yegorslists@googlemail.com>
Message-ID: <20160921205231.08b73e4c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 21 Sep 2016 15:40:44 +0200, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> python-daemon package mentions python-docutils in both setup_requires
> and instal_requires fields. So add related dependencies.
> 
> Fixes:
> http://autobuild.buildroot.net/results/0c3/0c3866038f7c40888e5e440f7a720fc614a6b1ba/
> http://autobuild.buildroot.net/results/5d8/5d817bddeff5bb49ed31c6a1d111974c358ef96c/
> and many more.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/python-daemon/Config.in        | 1 +
>  package/python-daemon/python-daemon.mk | 1 +
>  2 files changed, 2 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
