From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 3 Jun 2018 20:34:34 +0200
Subject: [Buildroot] [PATCH next] package/imx-mkimage: update hash
In-Reply-To: <1527791628-7336-1-git-send-email-karl.erik.larsson@gmail.com>
References: <1527791628-7336-1-git-send-email-karl.erik.larsson@gmail.com>
Message-ID: <20180603203434.4b27b335@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 31 May 2018 20:33:48 +0200, Erik Larsson wrote:
> Due to an update in the tar logic, see commit 6e2f5d0254 (download/git: fix
> transform regexp for older tar versions ) - This hash needs to be updated.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/1ff53d2b6b9927403c44447a5c8d3d6b3b2bfe33/
> 
> Signed-off-by: Erik Larsson <karl.erik.larsson@gmail.com>

Next has been merged back into master, and this problem had already
been fixed in master, therefore this patch is not needed anymore. I've
marked it as Not Applicable in our patch tracking system.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
