From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 31 Mar 2018 22:48:46 +0200
Subject: [Buildroot] [PATCH 1/1] .gitlab-ci.yml: use image with flake8
In-Reply-To: <20180330231055.26326-1-ricardo.martincoski@gmail.com>
References: <20180330231055.26326-1-ricardo.martincoski@gmail.com>
Message-ID: <20180331224846.5a5fb366@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 30 Mar 2018 20:10:55 -0300, Ricardo Martincoski wrote:
> Bump the docker image to the latest tag to have flake8 pre-installed.
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
> After this, please consider applying this patch, currently in Deferred state:
> http://patchwork.ozlabs.org/patch/884978/ ".gitlab-ci.yml: check flake8"

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
