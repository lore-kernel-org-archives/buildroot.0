From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 May 2017 23:45:05 +0200
Subject: [Buildroot] [PATCH next 1/3] git: bump version to 2.13.0
In-Reply-To: <20170510110910.27889-1-Vincent.Riera@imgtec.com>
References: <20170510110910.27889-1-Vincent.Riera@imgtec.com>
Message-ID: <20170510234505.07913da7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 10 May 2017 12:09:08 +0100, Vicente Olivert Riera wrote:
> Patches 0001 and 0002 already included in this release:
>   https://github.com/git/git/commit/379642bcd8d89db52feba88a651e4e56d6ac5767
>   https://github.com/git/git/commit/2225e1ea20481a7c0da526891470abf9ece623e7
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  .../git/0001-grep-set-default-output-method.patch  | 59 ---------------
>  ...ep-fix-builds-with-with-no-thread-support.patch | 87 ----------------------
>  package/git/git.hash                               |  2 +-
>  package/git/git.mk                                 |  2 +-
>  4 files changed, 2 insertions(+), 148 deletions(-)
>  delete mode 100644 package/git/0001-grep-set-default-output-method.patch
>  delete mode 100644 package/git/0002-grep-fix-builds-with-with-no-thread-support.patch

Series applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
