From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 27 Oct 2011 15:17:16 +0200
Subject: [Buildroot] [PATCH 1/3] binutils: Makefile and Config.in rework
	for oprofile ext toolchain compilation
In-Reply-To: <1307541448-15176-1-git-send-email-benoit.mauduit@gmail.com>
 (benoit mauduit's message of "Wed, 8 Jun 2011 15:57:26 +0200")
References: <1307541448-15176-1-git-send-email-benoit.mauduit@gmail.com>
Message-ID: <87obx2tvz7.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "benoit" == benoit mauduit <benoit.mauduit@gmail.com> writes:

 benoit> From: Benoit Mauduit <benoit.mauduit@openwide.fr>
 benoit>   * When select full binutils binaries use the default INSTALL_TARGET_CMDS
 benoit> from AUTOTARGET.
 benoit>   * Menu config improvement.
 benoit>   * Install libiberty into Staging dir.

Committed with minor changes, thanks.

-- 
Bye, Peter Korsgaard
