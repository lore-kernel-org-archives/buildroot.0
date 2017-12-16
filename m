From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Dec 2017 16:23:37 +0100
Subject: [Buildroot] [PATCH 1/1] gcc: Support configure option
 --with-linker-hash-style
In-Reply-To: <20171215232530.9388-1-stefan.froberg@petroprogram.com>
References: <20171215232530.9388-1-stefan.froberg@petroprogram.com>
Message-ID: <20171216162337.667a30da@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 16 Dec 2017 01:25:30 +0200, Stefan Fr?berg wrote:
> This will set the default hash style that GCC will 
> always use during linking.
> 
> Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>

Could you explain the motivation for configuring the default hash
style? If "gnu" gives the best application startup time, why would we
use a different one?

Generally, the commit log lacks a bit of background, i.e the "why" we
would want such a change.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
