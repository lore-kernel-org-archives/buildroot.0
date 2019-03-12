From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 12 Mar 2019 22:28:49 +0100
Subject: [Buildroot] [PATCH 1/1] package/wpewebkit: fix host gcc >= 4.8
 check
In-Reply-To: <20190310031407.1450-1-james.hilliard1@gmail.com>
References: <20190310031407.1450-1-james.hilliard1@gmail.com>
Message-ID: <20190312222849.30718783@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 10 Mar 2019 11:14:07 +0800
james.hilliard1 at gmail.com wrote:

> From: James Hilliard <james.hilliard1@gmail.com>
> 
> We need host gcc >= 4.8 not host gcc < 4.8.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/wpewebkit/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
