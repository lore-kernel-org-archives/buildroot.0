From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 07 May 2017 21:27:30 +0200
Subject: [Buildroot] [PATCH] connman: update musl incompatibility reason
In-Reply-To: <37435abb853673f385d36cb7a54f71dc0b69d526.1494179640.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Sun, 7 May 2017 20:54:00 +0300")
References: <37435abb853673f385d36cb7a54f71dc0b69d526.1494179640.git.baruch@tkos.co.il>
Message-ID: <8737cgqxgd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > connman no longer triggers a conflict of userspace and kernel headers since
 > commit 69ced96355 (musl: workaround kernel if_ether.h header conflict). The
 > real blocker for musl build (besides a few missing includes here and there)
 > is the missing res_ninit() implementation. Update the comment accordingly.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
