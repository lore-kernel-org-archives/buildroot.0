From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Apr 2015 15:16:23 +0200
Subject: [Buildroot] [PATCH 2/4] Makefile: split off 'list-defconfigs'
 from 'help'
In-Reply-To: <1426967388-559-3-git-send-email-arnout@mind.be>
References: <1426967388-559-1-git-send-email-arnout@mind.be>
 <1426967388-559-3-git-send-email-arnout@mind.be>
Message-ID: <20150404151623.21ef7b0a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle (Essensium/Mind),

On Sat, 21 Mar 2015 20:49:46 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:
> As discussed in the FOSDEM2015 BR developer meeting, the output of
> 'make help' is too long for comfortable reading. To shorten it, split
> off the list of defconfigs in a new target, 'list-defconfigs'.
> 
> Declare the new target as phony.
> 
> Add 'list-defconfigs' to the documentation.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  Makefile                             | 10 ++++++----
>  docs/manual/customize-outside-br.txt |  6 +++---
>  docs/manual/make-tips.txt            |  6 ++++++
>  3 files changed, 15 insertions(+), 7 deletions(-)

Applied, thanks. Should the 'make help' text be extended to mention
'list-defconfigs' ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
