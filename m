From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 15:02:23 +0100
Subject: [Buildroot] [PATCH] docs/manual/prerequisite.txt: 'make
 xconfig' uses Qt5, not Qt4
In-Reply-To: <20191027132658.23897-1-peter@korsgaard.com>
References: <20191027132658.23897-1-peter@korsgaard.com>
Message-ID: <20191027150223.173136c7@windsurf.dhcp.lyon.intranet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 27 Oct 2019 14:26:58 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

> Since commit 6eacea5a (support/kconfig: bump to kconfig from Linux
> 4.17-rc2), xconfig uses Qt5, so update prerequisite.txt to match.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  docs/manual/prerequisite.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
