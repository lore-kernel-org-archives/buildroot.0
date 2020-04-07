From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 07 Apr 2020 09:17:35 +0200
Subject: [Buildroot] [PATCH] package/gcc: bump to version 9.3.0
In-Reply-To: <20200315161846.5827-1-romain.naour@smile.fr> (Romain Naour's
 message of "Sun, 15 Mar 2020 17:18:46 +0100")
References: <20200315161846.5827-1-romain.naour@smile.fr>
Message-ID: <87sghfrchc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@smile.fr> writes:

 > Remove upstream patch [1]
 > Rebase and rename 0002-xtensa-fix-PR-target-91880.patch
 > and 0003-or1k-Fix-issue-with-set_got-clobbering-LR-r9.patch

 > Tested using gitlab with Qemu runtime testing series [2] [3].

 > [1] https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=2e1e7ad18e121663082525a872f0d6fb32db4535
 > [2] https://gitlab.com/kubu93/buildroot/pipelines/125828238
 > [3] http://patchwork.ozlabs.org/project/buildroot/list/?series=159088

 > See:
 > https://gcc.gnu.org/pipermail/gcc-announce/2020/000161.html

 > Signed-off-by: Romain Naour <romain.naour@smile.fr>

Committed to 2020.02.x, thanks.

Given that they are just about to go EOL (and we didn't backport gcc
7.5.0) I have NOT committed to 2019.02.x and 2019.11.x.

-- 
Bye, Peter Korsgaard
