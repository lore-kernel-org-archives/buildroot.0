From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 4 Jun 2020 23:28:21 +0200
Subject: [Buildroot] [PATCH v1] package/valgrind: bump version to 3.16.0
In-Reply-To: <20200603212134.18303-1-ps.report@gmx.net>
References: <20200603212134.18303-1-ps.report@gmx.net>
Message-ID: <20200604232821.17521e7f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  3 Jun 2020 23:21:34 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> - removed 0003-mips-fix-mips32r6-and-mips64r6-compilation-issue.patch
>   (backport from upstream commit [1])
> 
> [1] https://sourceware.org/git/?p=valgrind.git;a=commit;h=50dd9600ab1ad8933704ee85289191d9c65ba444
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  ...s32r6-and-mips64r6-compilation-issue.patch | 51 -------------------
>  package/valgrind/valgrind.hash                |  6 +--
>  package/valgrind/valgrind.mk                  |  2 +-
>  3 files changed, 4 insertions(+), 55 deletions(-)
>  delete mode 100644 package/valgrind/0003-mips-fix-mips32r6-and-mips64r6-compilation-issue.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
