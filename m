From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Jun 2016 00:11:58 +0200
Subject: [Buildroot] [PATCH v4] igmpproxy: bump version to
 a731683d1a65956fa05024b0597b105fe6a3a122
In-Reply-To: <1463668693-1367-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1463668693-1367-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20160610001158.43d6f195@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 19 May 2016 09:38:13 -0500, Matt Weber wrote:
> Adds uclinux support.
> 
> Fixes the following musl use standard unsigned integer
> types autobuilder failures.
> http://autobuild.buildroot.net/results/c6a/c6a6eec34cffb2c7876595b36fb8a01f475583f9/
> http://autobuild.buildroot.net/results/943/9432748bf7b1e24db9fcb0a8cce6942fcdf6be5b/
> http://autobuild.buildroot.net/results/083/083c61f43c2f1f0dec69d44583b447a0520933b7/
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> --
> v3 -> v4
>  - Squashed bump and uclinux removal patches (Suggested by Baruch/Thomas)
>    - Removes uclinux 0001- patch as the work was upstreamed
>  - Removed previous hash value from hash file (Suggested by Thomas)
> 
> v2-> v3
>  - New upstream contains required changes, bumping version
> 
> v1 -> v2
> (Suggested by Thomas)
>  - Updated patch comment to correctly represent the origin
>    and latest issue tracking
>  - Updated title to reflect patch purpose
> ---
>  package/igmpproxy/0001-uclinux.patch | 16 ----------------
>  package/igmpproxy/igmpproxy.hash     |  2 +-
>  package/igmpproxy/igmpproxy.mk       |  5 ++---
>  3 files changed, 3 insertions(+), 20 deletions(-)
>  delete mode 100644 package/igmpproxy/0001-uclinux.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
