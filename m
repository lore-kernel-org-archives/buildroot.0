From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Sep 2019 14:54:00 +0200
Subject: [Buildroot] [PATCH] package/util-linux: create
 $(TARGET_DIR)/etc/pam.d if necessary
In-Reply-To: <20190914164143.4644-1-unixmania@gmail.com>
References: <20190914164143.4644-1-unixmania@gmail.com>
Message-ID: <20190915145400.6908cb3e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 14 Sep 2019 13:41:43 -0300
unixmania at gmail.com wrote:

> From: Carlos Santos <unixmania@gmail.com>
> 
> Useful for test purposes when we want to install util-linux with a
> custom TARGET_DIR, e.g.
> 
>     $ make util-linux-reinstall TARGET_DIR=/tmp/util-linux
> 
> Signed-off-by: Carlos Santos <unixmania@gmail.com>
> ---
>  package/util-linux/util-linux.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Even if not strictly needed, I have changed the second $(INSTALL)
invocation to also pass -D, and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
