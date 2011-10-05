From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 05 Oct 2011 23:07:36 +0200
Subject: [Buildroot] [PATCH] pkg-stats: use correct variable names for
	convert_to_*autotools
In-Reply-To: <ADE657CA350FB648AAC2C43247A983F001F39DCFE980@AUSP01VMBX24.collaborationhost.net>
 (H. Hartley Sweeten's message of "Wed, 5 Oct 2011 15:34:59 -0500")
References: <ADE657CA350FB648AAC2C43247A983F001F39DCFE980@AUSP01VMBX24.collaborationhost.net>
Message-ID: <874nzn5eqv.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "H" == H Hartley Sweeten <hartleys@visionengravers.com> writes:

 H> The variable convert_to_autotools is not used in the script.  The correct
 H> variables are convert_to_target_autotools and convert_to_host_autotools.

 H> Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
