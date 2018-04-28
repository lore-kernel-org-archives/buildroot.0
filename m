From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Apr 2018 23:30:46 +0200
Subject: [Buildroot] [PATCH v2 1/1] vte: new package
In-Reply-To: <20180131150953.GE13531@gmail.com>
References: <20180116231558.7316-1-stefan.froberg@petroprogram.com>
 <20180131150953.GE13531@gmail.com>
Message-ID: <20180428233046.5f02b189@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 31 Jan 2018 16:09:53 +0100, Marcus Folkesson wrote:

> > +VTE_LICENSE = LGPL-2.1-or-later  
> 
> The license is LGPL-2.1, no "or-later" on this one.

I don't know where you have seen this, but it seems incorrect, and
Stefan's patch is good. All license files say:

 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.

So the license is really LGPLv2.1 or later.

However, our encoding for the "or later" in Buildroot currently doesn't
comply with SPDX. I.e we use LGPL-2.1+ and not LGPL-2.1-or-later. I'll
fix that up when applying.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
