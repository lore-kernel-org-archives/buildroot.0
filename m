From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 14 Oct 2020 20:43:16 +0200
Subject: [Buildroot] [PATCH 1/2] package/systemd: link libqrencode
 independent of remote
In-Reply-To: <20201014151249.18330-2-buildroot@heine.tech>
References: <20201014151249.18330-1-buildroot@heine.tech>
 <20201014151249.18330-2-buildroot@heine.tech>
Message-ID: <20201014204316.2863d297@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 14 Oct 2020 17:12:49 +0200
Michael Nosthoff via buildroot <buildroot@busybox.net> wrote:

> systemds libqrencode support is independent from journal-gatewayd.
> In v247 it will additionally be used in homectl for recovery key
> generation.
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> ---
>  package/systemd/systemd.mk | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
