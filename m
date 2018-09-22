From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 22 Sep 2018 18:42:56 +0200
Subject: [Buildroot] [PATCH v2 1/2] monkey: bump to version 1.6.9
In-Reply-To: <1537189549-26857-1-git-send-email-david.pierret@smile.fr>
References: <1537189549-26857-1-git-send-email-david.pierret@smile.fr>
Message-ID: <20180922184256.24f73ace@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello David,

On Mon, 17 Sep 2018 15:05:48 +0200, david.pierret at smile.fr wrote:
> From: David Pierret <david.pierret@gmail.com>
> 
> This commit update monkey-server package to 1.6.9
> 
> The --datadir option have been moved to --webroot.
> The --plugdir option does not exist anymore.
> 
> Signed-off-by: David Pierret <david.pierret@gmail.com>

This update is causing a number of failures in the autobuilders:

  http://autobuild.buildroot.net/?reason=monkey-1.6.9

Could you have a look and submit patches fixing that ?

Thanks a lot,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
