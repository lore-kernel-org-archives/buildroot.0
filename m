From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Jul 2020 18:40:35 +0200
Subject: [Buildroot] [PATCH v2 1/4] package/poco: add
 BR2_PACKAGE_POCO_ARCH_SUPPORTS
In-Reply-To: <20200630173435.7828-1-juju@cotds.org> (Julien Olivain's message
 of "Tue, 30 Jun 2020 19:34:32 +0200")
References: <20200629210735.179913-1-juju@cotds.org>
 <20200630173435.7828-1-juju@cotds.org>
Message-ID: <87blkfs9a4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Julien" == Julien Olivain <juju@cotds.org> writes:

 > This change is motivated by a misalignment of the Kconfig package and
 > comment dependencies, introduced in commit 0737f48c5f "package/poco:
 > disable build for riscv" (BR_riscv was missing in the comment).
 > Introducing BR2_PACKAGE_POCO_ARCH_SUPPORTS solve this issue.

 > Signed-off-by: Julien Olivain <juju@cotds.org>
 > ---
 > Changes v1 -> v2:
 > Suggested by Thomas:
 >   - introduce _ARCH_SUPPORTS to prevent duplicating dependency conditions

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
