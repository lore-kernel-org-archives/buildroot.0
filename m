From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 Sep 2020 20:54:01 +0200
Subject: [Buildroot] [PATCH] support/scripts: fix flake8 errors in
 cve-checker and pkg-stats
In-Reply-To: <20200902212157.15518-1-yann.morin.1998@free.fr>
References: <20200902212157.15518-1-yann.morin.1998@free.fr>
Message-ID: <20200903205401.3825ebf9@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  2 Sep 2020 23:21:57 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Note that one is silenced, rather than fixed: we indeed need to import
> after we add the local dorectory to the modules search path.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> ---
>  support/scripts/cve-checker | 8 ++++++--
>  support/scripts/pkg-stats   | 8 +++-----
>  2 files changed, 9 insertions(+), 7 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
