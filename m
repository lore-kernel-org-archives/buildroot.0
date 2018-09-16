From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Sep 2018 21:48:08 +0200
Subject: [Buildroot] [PATCH v5 2/3] docker-containerd: bump to v1.1.3
In-Reply-To: <20180913052225.26676-2-christian@paral.in>
References: <20180913052225.26676-1-christian@paral.in>
 <20180913052225.26676-2-christian@paral.in>
Message-ID: <20180916214808.5d5fdc8a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 12 Sep 2018 22:22:24 -0700, Christian Stewart wrote:
> This commit bumps docker-containerd to v1.1.3.
> 
> This is a requisite bump for the upgrade of docker-engine to 2018.06.
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> 
> ---

You forgot to update the <pkg>_LICENSE variable: the LICENSE.code file
was renamed to LICENSE. I fixed that and added a hash for the license
file.

Please remember to test legal-info when you're bumping packages. Thanks!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
