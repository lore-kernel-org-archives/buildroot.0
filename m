From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 10 Aug 2018 15:48:34 +0200
Subject: [Buildroot] [PATCH 2/2] Revert "package/mono: remove target
 mips architecture"
In-Reply-To: <1533817887-8771-2-git-send-email-angelo@amarulasolutions.com>
References: <1533817887-8771-1-git-send-email-angelo@amarulasolutions.com>
 <1533817887-8771-2-git-send-email-angelo@amarulasolutions.com>
Message-ID: <20180810154834.0631a2ad@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  9 Aug 2018 14:31:27 +0200, Angelo Compagnucci wrote:
> This reverts commit 0f96073561badde3c7abdf338abca7d00dba56dd cause the
> newly released mono version (5.14.0.177) fixed the bug upstream.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
>  package/mono/Config.in | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
