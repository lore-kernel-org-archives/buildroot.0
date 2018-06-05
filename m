From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 Jun 2018 15:07:29 +0200
Subject: [Buildroot] [PATCH 1/1] More complete usage string.
In-Reply-To: <20180605123959.21925-1-F.LaRoche@pilz.de>
References: <20180605123959.21925-1-F.LaRoche@pilz.de>
Message-ID: <20180605150729.764ef541@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 5 Jun 2018 14:39:59 +0200, Florian La Roche wrote:
> More complete usage string for the logging service.
> 
> 
> Signed-off-by: Florian La Roche <F.LaRoche@pilz.de>

A better commit log for this one would be:

busybox: fix usage string in S01logging

The S01logging usage text doesn't document the reload target, even
though it exists, so fix that.

Signed-off-by: ...

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
