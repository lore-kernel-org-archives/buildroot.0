From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 24 Aug 2018 10:27:58 +0200
Subject: [Buildroot] [git commit] configs/arm_juno: bump ATF to v1.3
In-Reply-To: <20180812144740.C664B813DF@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Sun, 12 Aug 2018 16:53:31 +0200")
References: <20180812144740.C664B813DF@busybox.osuosl.org>
Message-ID: <87ftz4kw35.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=395bc11dde5b4ef034118a9be568131f134daaa3
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > ATF in version 1.2 fails to build with:

 > ./build/juno/release/bl1/context_mgmt.o: In function `cm_prepare_el3_exit':
 > context_mgmt.c:(.text.cm_prepare_el3_exit+0x54): undefined reference to `cm_set_next_context'
 > context_mgmt.c:(.text.cm_prepare_el3_exit+0x54): relocation truncated to fit: R_AARCH64_JUMP26 against undefined symbol `cm_set_next_context'

 > This has been fixed in ATF v1.3. Even though there are even newer
 > versions of ATF available, we take a conservative approach, and bump
 > to the first version that has the build issue fixed.

 > Fixes:

 >   https://gitlab.com/buildroot.org/buildroot/-/jobs/88314771

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.02.x and 2018.05.x, thanks.

-- 
Bye, Peter Korsgaard
