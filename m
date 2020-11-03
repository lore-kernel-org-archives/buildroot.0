From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 3 Nov 2020 23:43:15 +0100
Subject: [Buildroot] [PATCH] Revert "keepalived: needs headers >= 3.4"
In-Reply-To: <20201101234810.10137-1-vadym.kochan@plvision.eu>
References: <20201101234810.10137-1-vadym.kochan@plvision.eu>
Message-ID: <20201103234315.24e2ae17@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  2 Nov 2020 01:48:10 +0200
Vadym Kochan <vadym.kochan@plvision.eu> wrote:

> This reverts commit d01b0bbad04b97a5e8e1dd3ac3c1026555f793fb.
> 
> Original commit  made restriction for Linux headers < 3.4 which was
> related to keepalived version 1.3.5, but it compiles fine now at least
> with a toolchain based on 3.2 headers and keepalived 2.0.15 together
> with ipset enabled.
> 
> Probably it was fixed by this commit:
> 
>     https://github.com/acassen/keepalived/commit/5a7f895bb795269f79e6353c6269dfbc0b782281
> 
> Signed-off-by: Vadym Kochan <vadym.kochan@plvision.eu>
> ---
>  package/keepalived/Config.in | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
