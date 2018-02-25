From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Feb 2018 21:55:08 +0100
Subject: [Buildroot] [PATCH] website: update package number text
In-Reply-To: <20180222221731.7946-1-peter@korsgaard.com>
References: <20180222221731.7946-1-peter@korsgaard.com>
Message-ID: <20180225215508.3f13123e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 22 Feb 2018 23:17:31 +0100, Peter Korsgaard wrote:
> We have quite a bit more than "hundreds of packages" nowadays:
> 
> find package -name \*.mk | wc -l
> 2285
> 
> So adjust the text to say 'several thousand' instead.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  docs/website/index.html | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
