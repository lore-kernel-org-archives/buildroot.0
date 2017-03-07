From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Mar 2017 21:17:11 +0100
Subject: [Buildroot] [PATCH] package/cairo: improve license information
In-Reply-To: <a8c8c494-b69c-2d6b-b505-03f113097a38@imgtec.com>
References: <20170306210218.28867-1-romain.naour@gmail.com>
 <a8c8c494-b69c-2d6b-b505-03f113097a38@imgtec.com>
Message-ID: <20170307211711.348d28cb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 7 Mar 2017 14:54:24 +0530, Rahul Bedarkar wrote:

> License string for LGPL should be "LGPLv2.1" because license text 
> doesn't have "or (at your option) any later version;" clause.

The license file itself never says "or (at your option) any later
version". The license text of the GPL or LGPL is always the text of one
specific version of the license. To know whether "or later" applies or
not, you usually need to look at the comments in the code. In the case
of cairo, they say:

 * This library is free software; you can redistribute it and/or
 * modify it either under the terms of the GNU Lesser General Public
 * License version 2.1 as published by the Free Software Foundation
 * (the "LGPL") or, at your option, under the terms of the Mozilla
 * Public License Version 1.1 (the "MPL"). If you do not alter this
 * notice, a recipient may use your version of this file under either
 * the MPL or the LGPL.

Which indeed indicates LGPLv2.1 only, and not any other version.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
