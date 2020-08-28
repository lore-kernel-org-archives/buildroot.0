From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 16:54:48 +0200
Subject: [Buildroot] [PATCH 2/2] boot/uboot: Fix kconfig to use
 $(BR2_MAKE)
In-Reply-To: <20200804190005.114872-2-brandon.maier@rockwellcollins.com>
 (Brandon Maier's message of "Tue, 4 Aug 2020 14:00:05 -0500")
References: <20200804190005.114872-1-brandon.maier@rockwellcollins.com>
 <20200804190005.114872-2-brandon.maier@rockwellcollins.com>
Message-ID: <87a6yeyg5j.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Brandon" == Brandon Maier <brandon.maier@rockwellcollins.com> writes:

 > U-Boot must use $(BR2_MAKE) as it uses a Make feature from v4.0. We
 > already use $(BR2_MAKE) in the BUILD_CMDS, but the kconfig commands
 > still uses $(MAKE). Without this fix, building U-Boot with kconfig will
 > fail with the following cryptic error.

 >> Makefile:37: *** missing separator.  Stop.

 > Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
