From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 14 Dec 2012 00:52:51 +0100
Subject: [Buildroot] [PATCH 1/4] package/qemu: fix host-qemu variable
	names
In-Reply-To: <ef84613fdc32788b96df51eb2c074c547424ac9c.1355434710.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Thu, 13 Dec 2012 22:39:37 +0100")
References: <cover.1355434710.git.yann.morin.1998@free.fr>
 <cover.1355434710.git.yann.morin.1998@free.fr>
 <ef84613fdc32788b96df51eb2c074c547424ac9c.1355434710.git.yann.morin.1998@free.fr>
Message-ID: <87zk1hjyr0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 Yann> With the upcoming introduction of qemu-on-target, we need to properly
 Yann> separate the variables used for the host qemu, from the variables
 Yann> used for the target qemu.

Committed, thanks.

-- 
Bye, Peter Korsgaard
