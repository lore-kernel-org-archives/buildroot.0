From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Jun 2014 19:05:56 +0200
Subject: [Buildroot] [PATCH] graph-depends.py: support python3
In-Reply-To: <1403296447-24706-1-git-send-email-arnout@mind.be>
References: <1403296447-24706-1-git-send-email-arnout@mind.be>
Message-ID: <20140622190556.4061c186@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle (Essensium/Mind),

On Fri, 20 Jun 2014 22:34:07 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> This patch is the result of 2to3.
> 
> In addition, universal_newlines=True is added to the Popen calls. In
> python3, this makes sure that the output is decoded so that we get a
> string instead of a buffer object.
> 
> Cc: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  support/scripts/graph-depends | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
