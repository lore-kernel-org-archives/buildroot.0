From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 24 Aug 2018 23:57:59 +0200
Subject: [Buildroot] [PATCH v3 1/2] i2c-tools: include LGPL-2.1+ license
 for libi2c
In-Reply-To: <1535118847-21086-2-git-send-email-brad@nextdimension.cc>
References: <1535118847-21086-1-git-send-email-brad@nextdimension.cc>
 <1535118847-21086-2-git-send-email-brad@nextdimension.cc>
Message-ID: <20180824235759.4edac1f1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 24 Aug 2018 08:54:06 -0500, Brad Love wrote:
> Extend i2c-tools SPDX identifiers to include the library license.
> Also include COPYING.LGPL and README to license files.
> 
> The ic2-tools readme states:
> 
> LICENSE
> 
> Check the documentation of individual tools for licensing information.
> The library is released under the LGPL version 2.1 or later, while most
> tools are released under the GPL version 2 or later, but there are a few
> exceptions.
> 
> Signed-off-by: Brad Love <brad@nextdimension.cc>

I've applied to master, but after adding the hashes of the additional
license files to i2c-tools.hash.

Yann: is it expected than missing hashes for license files is not a
hard failure, when a hash file is present ? Perhaps it was back in the
days, but maybe we should tighten up this ?

Or at least in the case where one of the license files has a hash that
is present, which was the case here.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
