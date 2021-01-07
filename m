From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 Jan 2021 23:33:34 +0100
Subject: [Buildroot] [PATCH] package/libiec61850: new package
In-Reply-To: <20200424170435.22430-1-romain.naour@smile.fr>
References: <20200424170435.22430-1-romain.naour@smile.fr>
Message-ID: <20210107233334.4ce9f1c4@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 24 Apr 2020 19:04:35 +0200
Romain Naour <romain.naour@smile.fr> wrote:

> Don't add mbedtls support since it require a bundled and specific
> version.
> 
> Keep experimental Python binding support disabled for now.
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to master, thanks! The only change I did is change the license
from GPL-3.0 to GPL-3.0+ since all source files I could check do have
the "or later" option.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
