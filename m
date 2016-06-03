From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Jun 2016 09:54:27 +0200
Subject: [Buildroot] [PATCH 1/5] ser2net: bump to version 2.10.1
In-Reply-To: <1464876330-6890-1-git-send-email-yegorslists@googlemail.com>
References: <1464876330-6890-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20160603095427.30ad707b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  2 Jun 2016 16:05:26 +0200, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Remove upstreamed patch.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  .../0001-Fix-TIOCSRS485-undeclared-error.patch     | 65 ----------------------
>  package/ser2net/ser2net.hash                       |  2 +-
>  package/ser2net/ser2net.mk                         |  2 +-
>  3 files changed, 2 insertions(+), 67 deletions(-)
>  delete mode 100644 package/ser2net/0001-Fix-TIOCSRS485-undeclared-error.patch

All applied to master. I only did a minor change on PATCH 5/5, I'll
reply to it directly.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
