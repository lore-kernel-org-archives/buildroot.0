From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Jul 2017 09:21:05 +0200
Subject: [Buildroot] [PATCH] bwm-ng: update to latest upstream version
 to fix build issue
In-Reply-To: <1499250824-26093-1-git-send-email-keguang.zhang@gmail.com>
References: <1499250824-26093-1-git-send-email-keguang.zhang@gmail.com>
Message-ID: <20170719092105.7be1353c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  5 Jul 2017 18:33:44 +0800, Kelvin Cheung wrote:
> From: Keguang Zhang <keguang.zhang@spreadtrum.com>
> 
> The latest upstream version had fixed the build issus.
> 
> Fixes:
> http://autobuild.buildroot.net/results/1d9/1d9f0b62e4cc387f508b4fe0086621ab9996a085/
> 
> Signed-off-by: Keguang Zhang <keguang.zhang@spreadtrum.com>
> ---
>  package/bwm-ng/bwm-ng.hash | 2 +-
>  package/bwm-ng/bwm-ng.mk   | 5 +++--
>  2 files changed, 4 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
