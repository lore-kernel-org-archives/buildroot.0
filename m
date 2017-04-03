From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Apr 2017 14:33:29 +0200
Subject: [Buildroot] [PATCH] package/tyrian: fixes compilation with
 static libs.
In-Reply-To: <1491222343-29223-1-git-send-email-julien.boibessot@free.fr>
References: <1491222343-29223-1-git-send-email-julien.boibessot@free.fr>
Message-ID: <20170403143329.7431c8b4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  3 Apr 2017 14:25:43 +0200, julien.boibessot at free.fr wrote:
> From: Julien BOIBESSOT <julien.boibessot@armadeus.com>
> 
> Has been tested with: "./support/scripts/test-pkg -c tyrian.cfg -p opentyrian"
> Fixes: http://autobuild.buildroot.net/results/0e2345db82b33f591958fc0f72ad914adafe0522
> and some similar previous build failure.
> 
> Thanks Thomas for the tip ;-).
> 
> Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
> ---
>  package/opentyrian/opentyrian.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
