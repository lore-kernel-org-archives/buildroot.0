From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Sep 2018 17:07:16 +0200
Subject: [Buildroot] [PATCH 1/1] busybox: bump version to 1.29.3
In-Reply-To: <2b8099d90190e1e37f412594ad2978cd@ombud.nl>
References: <20180922140641.9937-1-ferdinand@ombud.nl>
 <20180922184215.6ebaf7fa@windsurf>
 <2b8099d90190e1e37f412594ad2978cd@ombud.nl>
Message-ID: <20180923170716.7409afa3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 22 Sep 2018 19:16:05 +0200, Ferdinand van Aartsen wrote:

> Note that the commit you linked is _not_ identical to that patch.
> The patch has "int i" the commit has "size_t i". You can see the
> update to the patch in the busybox master commit:
> 22a99516206b33b7ae124d426319bab03d5c8309
> 
> I've tested and the change from int to size_t fixed a segfault.

Indeed, thanks for the additional explanation!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
