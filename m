From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 18 Mar 2012 20:47:47 +0100
Subject: [Buildroot] [PATCH] elf2flt: fix after conversion of binutils
	to package infrastructure
In-Reply-To: <1332084958-1085-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Sun, 18 Mar 2012 16:35:58 +0100")
References: <1332084958-1085-1-git-send-email-arnout@mind.be>
Message-ID: <87ty1ln124.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 Arnout> When binutils was converted to the package infrastructure (commit
 Arnout> 009407e6b), the variable that elf2flt uses to find the binutils
 Arnout> libraries disappeared.  So use HOST_BINUTILS_DIR instead of
 Arnout> BINUTILS_DIR1.

Committed, thanks.

-- 
Bye, Peter Korsgaard
