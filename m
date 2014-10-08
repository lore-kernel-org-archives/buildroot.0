From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 08 Oct 2014 20:06:40 +0200
Subject: [Buildroot] [PATCH] configs/qemu: enable tmpfs for custom
	configs
In-Reply-To: <1412785772-32552-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 8 Oct 2014 13:29:32 -0300")
References: <1412785772-32552-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <877g0acu6n.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Enable TMPFS support for our custom qemu kernel configs, it's generally
 > used and can lead to failures/confusion.
 > Moreover enable ACL & XATTR TMPFS support for SystemD.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
