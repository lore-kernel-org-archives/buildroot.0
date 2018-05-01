From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 May 2018 08:56:45 +0200
Subject: [Buildroot] [PATCH] support/testing: fix ATF Vexpress test case
In-Reply-To: <20180425212923.4418350b@windsurf> (Thomas Petazzoni's message of
 "Wed, 25 Apr 2018 21:29:23 +0200")
References: <20180423201456.3303-1-thomas.petazzoni@bootlin.com>
 <20180425212923.4418350b@windsurf>
Message-ID: <87tvrrlv82.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Hello,
 > On Mon, 23 Apr 2018 22:14:56 +0200, Thomas Petazzoni wrote:
 >> This test case currently fails to build with:
 >> 
 >> ./build/juno/release/bl1/context_mgmt.o: In function `cm_prepare_el3_exit':
 >> context_mgmt.c:(.text.cm_prepare_el3_exit+0x54): undefined reference to `cm_set_next_context'
 >> context_mgmt.c:(.text.cm_prepare_el3_exit+0x54): relocation truncated to fit: R_AARCH64_JUMP26 against undefined symbol `cm_set_next_context'
 >> 
 >> This issue has been fixed upstream in commit
 >> 10c252c14b7f446c0b49ef1aafbd5d37804577dd, available since v1.3. So
 >> while we bump, let's bump to the latest version of ATF, v1.5.
 >> 
 >> Fixes:
 >> 
 >> https://gitlab.com/buildroot.org/buildroot/-/jobs/64360659
 >> 
 >> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
