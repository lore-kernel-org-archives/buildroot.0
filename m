From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Nov 2017 21:14:13 +0100
Subject: [Buildroot] [for-next: v4: 1/2] package/physfs: bump to 3.0.1
In-Reply-To: <20171129200452.16614-1-romain.naour@gmail.com>
References: <20171129200452.16614-1-romain.naour@gmail.com>
Message-ID: <20171129211413.2410ac0f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 29 Nov 2017 21:04:51 +0100, Romain Naour wrote:
> Remove upstream patch.
> 
> Use the official archive and add a hash file.
> Also add a license file hash.
> 
> Remove LGPL.txt license file since src/lzma directory has been removed
> from the sources.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Julien BOIBESSOT <julien.boibessot@armadeus.com>
> ---
>  .../physfs/0001-Fix-builds-with-modern-GCC.patch   | 38 ----------------------
>  package/physfs/physfs.hash                         |  3 ++
>  package/physfs/physfs.mk                           | 10 +++---
>  3 files changed, 8 insertions(+), 43 deletions(-)
>  delete mode 100644 package/physfs/0001-Fix-builds-with-modern-GCC.patch
>  create mode 100644 package/physfs/physfs.hash

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
