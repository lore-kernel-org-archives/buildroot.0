From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Jul 2015 02:12:08 +0200
Subject: [Buildroot] [PATCH v3 1/2] purge-locales: further refactoring
 after removing man paths
In-Reply-To: <1436831128-19423-1-git-send-email-arnout@mind.be>
References: <1436831128-19423-1-git-send-email-arnout@mind.be>
Message-ID: <20150714021208.7fe28c41@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle (Essensium/Mind),

On Tue, 14 Jul 2015 01:45:27 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> Since the man paths have been removed, it is no longer necessary to
> grep them out and the loop can be simplified.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
> v3: Partial rebase, since v1 was already merged.
> v2: remove the grep -v man as well, which allows us to use $dir/*
>     instead of the funky ls construct.
> ---
>  Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Both applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
