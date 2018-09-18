From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Sep 2018 22:02:31 +0200
Subject: [Buildroot] [PATCH v2 1/2] monkey: bump to version 1.6.9
In-Reply-To: <1537189549-26857-1-git-send-email-david.pierret@smile.fr>
References: <1537189549-26857-1-git-send-email-david.pierret@smile.fr>
Message-ID: <20180918220231.6fccba57@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 17 Sep 2018 15:05:48 +0200, david.pierret at smile.fr wrote:
> From: David Pierret <david.pierret@gmail.com>
> 
> This commit update monkey-server package to 1.6.9
> 
> The --datadir option have been moved to --webroot.
> The --plugdir option does not exist anymore.
> 
> Signed-off-by: David Pierret <david.pierret@gmail.com>

I've applied to master, thanks. It's a bit weird now, because monkey
plugins are installed directly in /usr/lib, and no longer
in /usr/lib/monkey. But after looking at the CMakeLists.txt logic, it
indeed seems like it's upstream intention to install them in /usr/lib.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
