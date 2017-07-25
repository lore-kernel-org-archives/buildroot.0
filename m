From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Jul 2017 23:24:17 +0200
Subject: [Buildroot] [PATCH v3 1/4] autobuild-run: use in-tree
 genrandconfig script (initial version)
In-Reply-To: <20170721010621.4877-1-arnout@mind.be>
References: <20170721010530.4747-1-arnout@mind.be>
 <20170721010621.4877-1-arnout@mind.be>
Message-ID: <20170725232417.697792f6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 21 Jul 2017 03:06:18 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> The Buildroot tree now has a genrandconfig script that replaces a
> large part of the autobuild-run script. Call this script rather than
> having it in autobuild-run.
> 
> The genrandconfig script inside the Buildroot tree has the advantage
> that it can be adapted to the changes in the source, without the
> need to update the autobuild-run script all the time. Also, it makes
> it feasible to support autobuilding multiple branches.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  scripts/autobuild-run | 301 +-------------------------------------------------
>  1 file changed, 6 insertions(+), 295 deletions(-)

All four patches applied to buildroot-test. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
