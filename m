From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Dec 2015 23:12:07 +0100
Subject: [Buildroot] [PATCH] git: bump version to 2.6.4
In-Reply-To: <1449656761-22843-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1449656761-22843-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20151209231207.7dae5f41@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Wed, 9 Dec 2015 10:26:01 +0000, Vicente Olivert Riera wrote:
> - Bump version to 2.6.4
> - Update the hash value
> - Remove 0002-Makefile-make-curl-config-path-configurable.patch
>   - This patch is now part of upstream:
>     https://github.com/git/git/commit/f89158760d5f02ba59f644799abd921e6be22f13
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  ...kefile-make-curl-config-path-configurable.patch | 88 ----------------------
>  package/git/git.hash                               |  2 +-
>  package/git/git.mk                                 |  2 +-
>  3 files changed, 2 insertions(+), 90 deletions(-)
>  delete mode 100644 package/git/0002-Makefile-make-curl-config-path-configurable.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
