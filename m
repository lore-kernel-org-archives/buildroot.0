From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 9 Dec 2018 16:51:41 +0100
Subject: [Buildroot] [PATCH] scanpypi: import third party modules after
 the standard ones
In-Reply-To: <20181207094041.20140-1-yegorslists@googlemail.com>
References: <20181207094041.20140-1-yegorslists@googlemail.com>
Message-ID: <20181209165141.5c9e17bb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yegor,

On Fri,  7 Dec 2018 10:40:41 +0100, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Move imports from six package after the standard modules. Resolves
> pylint warnings.

Thanks, but your SoB is missing here :-/

Also, when resending, you can adjust the commit title prefix to
utils/scanpypi.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
