From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Dec 2014 16:00:42 +0100
Subject: [Buildroot] [PATCH] freerdp: pass appropriate ARM ABI flags
In-Reply-To: <1419862290-6251-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 29 Dec 2014 15:11:30 +0100")
References: <1419862290-6251-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87oaqmcxgl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > In the line of commit 530693787b3 ("package/freerdp: do not use Neon
 > extensions when not available") done by Yann E. Morin, freerdp also
 > passes an explicit -mfloat-abi= flag, and defaults to softfp. This
 > obviously breaks badly when building an EABIhf system.

 > This commit therefore fixes freerdp.mk to pass the appropriate
 > ARM_FP_ABI value to freerdp's build system.

 > Fixes:

 >   http://autobuild.buildroot.org/results/6ca/6ca9de1a11c675533baa68f7a6bf7b6af7cb4345/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
