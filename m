From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 29 Mar 2019 17:03:38 +0100
Subject: [Buildroot] [PATCH] package/glibc: bump version for post-2.29
 security fixes
In-Reply-To: <20190329102414.10080-1-peter@korsgaard.com>
References: <20190329102414.10080-1-peter@korsgaard.com>
Message-ID: <20190329170338.5ffdf234@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 29 Mar 2019 11:24:14 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

> Fixes the following security vulnerability:
> 
>   CVE-2019-9169: Attempted case-insensitive regular-expression match
>   via proceed_next_node in posix/regexec.c leads to heap-based buffer
>   over-read.  Reported by Hongxu Chen.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  .../glibc.hash                                                          | 2 +-
>  package/glibc/glibc.mk                                                  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename package/glibc/{2.29-6-g067fc32968b601493f4b247a3ac00caeea3f3d61 => 2.29-11-ge28ad442e73b00ae2047d89c8cc7f9b2a0de5436}/glibc.hash (70%)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
