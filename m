From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 11 Sep 2014 22:53:23 +0200
Subject: [Buildroot] [PATCH] arch/arc: fix atomics selection
In-Reply-To: <1410468406-10535-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Thu, 11 Sep 2014 22:46:46 +0200")
References: <1410468406-10535-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <878ulpdgl8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Due to a kconfig limitation, we can't select a no-prompt symbol that
 > gets its dependencies by being conditionally re-defined in one or more
 > if-blocks, like we currently do for BR2_ARCH_HAS_ATOMICS.

 > As a workaround to this issue, we just redefine that symbol in the arc
 > if-block, like we do for all other architectures, except that in the arc
 > case, the default value is conditional.

 > Reported-by: Anton Kolesov <Anton.Kolesov@synopsys.com>
 > [yann.morin.1998 at free.fr: indepently re-done a patch similar to the one
 >  Thomas made on his own]
 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
