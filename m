From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 03 Dec 2013 13:11:46 +0100
Subject: [Buildroot] [PATCH] toolchain: Allow ld64.so linker
In-Reply-To: <20131203222613.27002db9@kryten> (Anton Blanchard's message of
 "Tue, 3 Dec 2013 22:26:13 +1100")
References: <20131203222613.27002db9@kryten>
Message-ID: <87zjoim8vx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Anton" == Anton Blanchard <anton@samba.org> writes:

 > From: Jeremy Kerr <jk@ozlabs.org>
 > The glibc dynamic linkers for ppc64 and s390x are named ld64.so.*
 > so modify the check_glibc test to match them.

 > Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
 > Signed-off-by: Anton Blanchard <anton@samba.org>

Committed, thanks.

-- 
Bye, Peter Korsgaard
