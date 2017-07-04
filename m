From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Jul 2017 19:26:19 +0200
Subject: [Buildroot] [PATCH] skalibs: fix bashism in type sizes patch
In-Reply-To: <20170704165822.12867-1-eric.le.bihan.dev@free.fr>
References: <20170704165822.12867-1-eric.le.bihan.dev@free.fr>
Message-ID: <20170704192619.1a36147e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  4 Jul 2017 18:58:22 +0200, Eric Le Bihan wrote:
> Instead of using a Bash-only variable substitution feature in the patch
> to determine type size at build time, invoke `sed` to make it portable.
> 
> Fixes:
> http://autobuild.buildroot.net/results/023/023d71356376bea13d16c43898a0347e41cd19b9/
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  .../skalibs/0002-No-runtime-tests-for-type-sizes.patch    | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
