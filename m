From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 May 2017 23:35:09 +0200
Subject: [Buildroot] [for-master] package/expedite: bump to the current
 master
In-Reply-To: <20170510164843.16001-1-romain.naour@gmail.com>
References: <20170510164843.16001-1-romain.naour@gmail.com>
Message-ID: <20170510233509.4d8ecf83@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 10 May 2017 18:48:43 +0200, Romain Naour wrote:
> The current master is ahead of one commit, this commit include
> the fix for the build issue reported upstream [1].
> Remove the patch 0001 which is no longer necessary.
> 
> [1] https://phab.enlightenment.org/T5440
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  .../0001-fix-build-failure-with-gcc-5.patch        | 289 ---------------------
>  package/expedite/expedite.hash                     |   2 +-
>  package/expedite/expedite.mk                       |   2 +-
>  3 files changed, 2 insertions(+), 291 deletions(-)
>  delete mode 100644 package/expedite/0001-fix-build-failure-with-gcc-5.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
