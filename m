From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Mar 2020 15:39:07 +0100
Subject: [Buildroot] [PATCH] package/gcc: bump to version 9.3.0
In-Reply-To: <20200315161846.5827-1-romain.naour@smile.fr>
References: <20200315161846.5827-1-romain.naour@smile.fr>
Message-ID: <20200322153907.43ddccd2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 15 Mar 2020 17:18:46 +0100
Romain Naour <romain.naour@smile.fr> wrote:

> Remove upstream patch [1]
> Rebase and rename 0002-xtensa-fix-PR-target-91880.patch
> and 0003-or1k-Fix-issue-with-set_got-clobbering-LR-r9.patch
> 
> Tested using gitlab with Qemu runtime testing series [2] [3].
> 
> [1] https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=2e1e7ad18e121663082525a872f0d6fb32db4535
> [2] https://gitlab.com/kubu93/buildroot/pipelines/125828238
> [3] http://patchwork.ozlabs.org/project/buildroot/list/?series=159088
> 
> See:
> https://gcc.gnu.org/pipermail/gcc-announce/2020/000161.html
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---
> Ignore csky issues already fixed by [4] [5].
> Ignore optee-os issue [6]

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
