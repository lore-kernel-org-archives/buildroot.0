From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Mar 2018 22:26:15 +0200
Subject: [Buildroot] [PATCH] Config.in: Document BR2_CCACHE_DIR override
In-Reply-To: <20180315214733.7320-1-tpiepho@impinj.com>
References: <20180315214733.7320-1-tpiepho@impinj.com>
Message-ID: <20180326222615.26321185@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 15 Mar 2018 14:47:33 -0700, Trent Piepho wrote:
> This variable, like BR2_DL_DIR, is designed to be overridable from the
> environment.  Unlike BR2_DL_DIR, it is not documented as such in the
> Config.in help text.  Do so now.
> 
> Signed-off-by: Trent Piepho <tpiepho@impinj.com>
> ---
>  Config.in | 3 +++
>  1 file changed, 3 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
