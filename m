From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Dec 2020 21:26:41 +0100
Subject: [Buildroot] [PATCH/next v1] package/rsyslog: bump version to
 8.2010.0
In-Reply-To: <20201202200731.25360-1-ps.report@gmx.net>
References: <20201202200731.25360-1-ps.report@gmx.net>
Message-ID: <20201205212641.0ee0508e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  2 Dec 2020 21:07:31 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> - disable new input module options imhttp and impcap
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/rsyslog/rsyslog.hash | 2 +-
>  package/rsyslog/rsyslog.mk   | 4 +++-
>  2 files changed, 4 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
