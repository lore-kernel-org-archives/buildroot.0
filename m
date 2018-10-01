From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Oct 2018 14:54:03 +0200
Subject: [Buildroot] [PATCH 2/2] toolchain-external: drop no longer
 needed CC_TARGET_<foo>_ variables
In-Reply-To: <20180923203850.19447-3-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sun, 23 Sep 2018 22:38:50 +0200")
References: <20180923203850.19447-1-thomas.petazzoni@bootlin.com>
 <20180923203850.19447-3-thomas.petazzoni@bootlin.com>
Message-ID: <87sh1prfo4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Since the introduction of the GCC_TARGET_<foo> variables in
 > arch/arch.mk in commit bd0640a2139119e2fdb4b384ebf32d1edcb0fdaa
 > ("arch: allow GCC target options to be optionally overwritten") and
 > the removal of the BR2_GCC_TARGET_CPU_REVISION, the CC_TARGET_<foo>_
 > variables in pkg-toolchain-external.mk map 1:1 with the corresponding
 > GCC_TARGET_<foo> variables.

 > So let's drop the CC_TARGET_<foo>_ variables, and use directly the
 > GCC_TARGET_<foo> ones.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
