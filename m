From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Nov 2014 08:14:15 +0100
Subject: [Buildroot] [PATCH] ndisc6: use LIBS for libintl
In-Reply-To: <1416358059-20276-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 18 Nov 2014 21:47:39 -0300")
References: <1416358059-20276-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87r3wzoe60.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Use LIBS instead of LDFLAGS for "-lintl", otherwise LDFLAGS gets
 > evaluated to the left of object files and fails to link statically
 > because of incorrect symbol resolution order. Fixes:
 > http://autobuild.buildroot.net/results/21b/21bf88c9dbaecc204598e60dd9c7392a85068dd6/

 > Also rename patch to new naming convention.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
