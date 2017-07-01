From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Jul 2017 19:44:39 +0200
Subject: [Buildroot] [PATCH 1/3] DEVELOPERS: fix after moving scripts to
 utils/ directory
In-Reply-To: <20170701164041.5515-1-arnout@mind.be>
References: <20170701164041.5515-1-arnout@mind.be>
Message-ID: <20170701194439.555fbf0c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 1 Jul 2017 18:40:39 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> There were still references to support/scripts/ for scripts that have
> moved to the utils directory. There were also references that were
> updated, but not re-updated when the tools moves to utils.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  DEVELOPERS | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

All three patches applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
