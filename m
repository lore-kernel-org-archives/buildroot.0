From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 11 May 2010 09:02:40 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	2010-05-10-fixes
In-Reply-To: <cover.1273527584.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Mon, 10 May 2010 23:39:46 +0200")
References: <cover.1273527584.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87wrva3oq7.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The following changes since commit af850ce10fc490036247a8c0dd92c79f18b2281a:
 Thomas>   Peter Korsgaard (1):
 Thomas>         Merge branch 'squashfs-fixes' of git://git.busybox.net/~tpetazzoni/git/buildroot

 Thomas> are available in the git repository at:

 Thomas>   git://git.busybox.net/~tpetazzoni/git/buildroot 2010-05-10-fixes

 Thomas> Thomas Petazzoni (5):
 Thomas>       grep: give hints to ./configure on where gettext() is
 Thomas>       hostapd: use internal crypto library
 Thomas>       less: depends on curses
 Thomas>       netplug: disable -Werror to fix build failure
 Thomas>       libnl: include limits.h to fix build failure

Thanks, committed everything besides the grep fix.

-- 
Bye, Peter Korsgaard
