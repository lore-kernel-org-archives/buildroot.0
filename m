From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Apr 2020 15:14:40 +0200
Subject: [Buildroot] [PATCH 1/1] package/systemd: enabled dnssec when
 available
In-Reply-To: <20200308220316.40922-1-james.hilliard1@gmail.com>
References: <20200308220316.40922-1-james.hilliard1@gmail.com>
Message-ID: <20200412151440.3c250d88@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  8 Mar 2020 16:03:16 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> When dnssec is available set default-dnssec to the backwards compatible
> allow-downgrade option.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/systemd/systemd.mk | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
