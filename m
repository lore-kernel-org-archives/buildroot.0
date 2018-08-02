From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 2 Aug 2018 15:47:26 +0200
Subject: [Buildroot] [PATCH] package/cutelyst: Update micro version for
 build fix
In-Reply-To: <20180802133813.12698-1-dantti12@gmail.com>
References: <20180802133813.12698-1-dantti12@gmail.com>
Message-ID: <20180802154726.46faa9d7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for this update!

On Thu,  2 Aug 2018 10:38:13 -0300, Daniel Nicoletti wrote:
> Signed-off-by: Daniel Nicoletti <dantti12@gmail.com>

If this is fixing a build issue reported by the autobuilders, please
include in your commit log something like this:

"""
Fixes:

  http://autobuild.buildroot.net/results/13442b0f6be7faaa2a188b9ae4fe3336e2614687/
"""

(Of course, use the correct hash, I just took a random build results to
illustrate here.)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
