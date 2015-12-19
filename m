From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Dec 2015 14:03:57 +0100
Subject: [Buildroot] [PATCH] Config.in.legacy: document how to handle
 renaming choice options
In-Reply-To: <1450482723-31514-1-git-send-email-arnout@mind.be>
References: <1450482723-31514-1-git-send-email-arnout@mind.be>
Message-ID: <20151219140357.6c54d8d5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle (Essensium/Mind),

On Sat, 19 Dec 2015 00:52:03 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:
> When a choice option is renamed, it is not possible to select the new
> option. Instead, the default for the new option should be set in the
> choice itself. So let's document this.
> 
> While we're at it, also reformat the whitespace in the example so a tab
> is used at the appropriate place.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Martin Bark <martin@barkynet.com>
> ---
>  Config.in.legacy | 74 ++++++++++++++++++++++++++++++++++++++++++--------------
>  1 file changed, 56 insertions(+), 18 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
