From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Apr 2019 17:30:06 +0200
Subject: [Buildroot] [PATCH 2/3] package/linux-tools: some selftests
 needs tput
In-Reply-To: <20190408164333.26942-3-romain.naour@smile.fr> (Romain Naour's
 message of "Mon, 8 Apr 2019 18:43:32 +0200")
References: <20190408164333.26942-1-romain.naour@smile.fr>
 <20190408164333.26942-3-romain.naour@smile.fr>
Message-ID: <87h8anctfl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@smile.fr> writes:

 > Some kernel-selftests are using tput program, so make sure that
 > BR2_PACKAGE_NCURSES_TARGET_PROGS is selected.

 > [linux-4.19 selftests]$ git grep tput
 > [...]
 > futex/run.sh:tput setf 7 || tput setaf 7
 > futex/run.sh:    tput sgr0

 > Signed-off-by: Romain Naour <romain.naour@smile.fr>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
