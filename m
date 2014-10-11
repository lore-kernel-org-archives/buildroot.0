From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 11 Oct 2014 13:02:24 +0200
Subject: [Buildroot] [PATCH] configs/qemu-sparc-ss10: enable tmpfs
In-Reply-To: <1412800100-9223-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 8 Oct 2014 17:28:20 -0300")
References: <1412800100-9223-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87wq867ttr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

Perhaps we should force CONFIG_TMPFS=y in linux/linux.mk like we do for
the other settings?

-- 
Bye, Peter Korsgaard
