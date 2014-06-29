From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Jun 2014 10:52:37 +0200
Subject: [Buildroot] [PATCH] graph-depends: fix when $(O) is a relative
 path
In-Reply-To: <1403129424-27129-1-git-send-email-arnout@mind.be>
References: <1403129424-27129-1-git-send-email-arnout@mind.be>
Message-ID: <20140629105237.65a58d59@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle (Essensium/Mind),

On Thu, 19 Jun 2014 00:10:24 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> The graph-depends commands cd into the CONFIG_DIR and run the script
> from there. However, this means that when $(O) is a relative path, it
> will no longer be correct.  Therefore, use $(BASE_DIR) instead of $(O).
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
