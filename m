From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 14 Jan 2013 19:34:40 +0100
Subject: [Buildroot] [PATCH 1/4] Makefile: export a few variables to
	help support scripts
In-Reply-To: <201301141838.46833.yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Mon, 14 Jan 2013 18:38:46 +0100")
References: <cover.1358113846.git.yann.morin.1998@free.fr>
 <877gngviel.fsf@dell.be.48ers.dk> <87y5fwtacd.fsf@dell.be.48ers.dk>
 <201301141838.46833.yann.morin.1998@free.fr>
Message-ID: <87zk0br4u7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 Yann> Yes, as an afterthought, exporting $(O) was bad.

 Yann> I was able to build both busybox and the Linux kernel with $(O),
 Yann> and I did not think about uClibc. Ough... :-( And yesterday was
 Yann> too late for me to spend more time on it, and removing $(O) would
 Yann> have been the first thing I would have tried tonight. Sorry for
 Yann> the mess...

No problem...

-- 
Bye, Peter Korsgaard
