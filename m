From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 Jun 2014 23:10:11 +0200
Subject: [Buildroot] [PATCH 17/26] package/procps: bump version and
 rename to procps-ng
In-Reply-To: <40c318b64d99494c2050d99e3abae26822d8c68b.1401656581.git.yann.morin.1998@free.fr>
References: <cover.1401656581.git.yann.morin.1998@free.fr>
 <40c318b64d99494c2050d99e3abae26822d8c68b.1401656581.git.yann.morin.1998@free.fr>
Message-ID: <20140601231011.7b4efd64@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun,  1 Jun 2014 23:03:41 +0200, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> procps is getting replaced by procps-ng, and there are
> new versions available!
> 
> procps-ng is now an autotools package, so get rid of our
> custom build/install rules.
> 
> Remove most patches, except for one that still half-applies,
> so update and rename it.
> 
> procps is dead, long live procps-ng!
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Merging this patch would fix
https://bugs.busybox.net/show_bug.cgi?id=6626.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
