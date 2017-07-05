From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 12:38:35 +0200
Subject: [Buildroot] [PATCH] bwm-ng: update to latest upstream version
 to fix build issue
In-Reply-To: <1499250824-26093-1-git-send-email-keguang.zhang@gmail.com>
References: <1499250824-26093-1-git-send-email-keguang.zhang@gmail.com>
Message-ID: <20170705123836.50903eeb@windsurf>
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

Thanks. However, rather than bumping and having to autoreconf, I'm
wondering if simply adding
https://github.com/vgropp/bwm-ng/commit/d5daf15c2098040b8b01753d3cdce8c1c79fc528.patch
inside package/bwm-ng/ isn't a simpler solution.

Peter?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
