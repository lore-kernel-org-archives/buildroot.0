From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Jul 2017 10:02:32 +0200
Subject: [Buildroot] [PATCH 1/3] mtd: fix build issues on older hosts
In-Reply-To: <20170706205849.22298-1-thomas.petazzoni@free-electrons.com>
References: <20170706205849.22298-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170707100232.0115d847@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  6 Jul 2017 22:58:47 +0200, Thomas Petazzoni wrote:
> Building the MTD test programs requires the MS_DIRSYNC, which is not
> necessarily available on old build machines. But obviously, MTD test
> programs are not needed, so we can simply disable them, as they were
> prior to the migration to mtd 2.0.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/21e1ad2a4560b6d3ba6490d20ae064246e66d5c1/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/mtd/mtd.mk | 1 +
>  1 file changed, 1 insertion(+)

Patches 1 and 2 applied. Thanks Arnout for the review.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
