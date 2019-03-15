From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Mar 2019 22:35:25 +0100
Subject: [Buildroot] [PATCHv2 2/2] package/glibc: bump to version 2.29
In-Reply-To: <20190312223525.17360-2-romain.naour@gmail.com>
References: <20190312223525.17360-1-romain.naour@gmail.com>
 <20190312223525.17360-2-romain.naour@gmail.com>
Message-ID: <20190315223525.6b937917@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 12 Mar 2019 23:35:25 +0100
Romain Naour <romain.naour@gmail.com> wrote:

> Changes to build and runtime requirements:
> 
> * Python 3.4 or later is required to build the GNU C Library.
> 
> * On most architectures, GCC 5 or later is required to build the GNU C
>   Library.  (On powerpc64le, GCC 6.2 or later is still required, as
>   before.)
> 
> While at it, remove the double "glibc-" prefix in the version.
> 
> https://www.sourceware.org/ml/libc-alpha/2019-01/msg00723.html
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
> v2: remove "glibc-" prefix in the version (Yann).
> ---
>  package/gcc/Config.in.host                                          | 6 ++----
>  .../glibc.hash                                                      | 2 +-
>  package/glibc/glibc.mk                                              | 6 +++---
>  3 files changed, 6 insertions(+), 8 deletions(-)
>  rename package/glibc/{glibc-2.28-69-g1e5c5303a522764d7e9d2302a60e4a32cdb902f1 => 2.29-6-g067fc32968b601493f4b247a3ac00caeea3f3d61}/glibc.hash (69%)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
