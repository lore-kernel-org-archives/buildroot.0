From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 07 Apr 2020 09:17:09 +0200
Subject: [Buildroot] [PATCH] package/gcc: bump to version 8.4.0
In-Reply-To: <20200309235030.12587-1-romain.naour@smile.fr> (Romain Naour's
 message of "Tue, 10 Mar 2020 00:50:30 +0100")
References: <20200309235030.12587-1-romain.naour@smile.fr>
Message-ID: <87wo6rrci2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@smile.fr> writes:

 > Remove upstream patch [1].
 > Rebase and rename 0002-xtensa-fix-PR-target-91880.patch

 > Tested using gitlab w/ Qemu runtime testing series [2] [3].

 > [1] https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=fba5d9b4c0f4488281efbeef56c100bb52e55165
 > [2] https://gitlab.com/kubu93/buildroot/pipelines/124684030
 > [3] http://patchwork.ozlabs.org/project/buildroot/list/?series=159088

 > Signed-off-by: Romain Naour <romain.naour@smile.fr>

Committed to 2020.02.x, thanks.

Given that they are just about to go EOL (and we didn't backport gcc
7.5.0) I have NOT committed to 2019.02.x and 2019.11.x.

-- 
Bye, Peter Korsgaard
