From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Mar 2019 18:45:47 +0100
Subject: [Buildroot] [PATCH] package/busybox: busybox.config: enable
 base64 applet
In-Reply-To: <20190326170749.10182-1-peter@korsgaard.com>
References: <20190326170749.10182-1-peter@korsgaard.com>
Message-ID: <20190326184547.30586a9c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 26 Mar 2019 18:07:48 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

> base64 reuses the uuencode logic, so only adds very little extra overhead,
> is enabled by default upstream and is used more often than uuencode - So
> enable it in the default busybox config.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/busybox/busybox.config | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
