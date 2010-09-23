From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 23 Sep 2010 23:04:49 +0200
Subject: [Buildroot] [PATCH] Makefile: generate a Makefile wrapper in
	$(O)
In-Reply-To: <1285107952-24098-1-git-send-email-yann.morin.1998@anciens.enib.fr>
	(Yann E. MORIN's message of "Wed, 22 Sep 2010 00:25:52 +0200")
References: <1285107952-24098-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <871v8k893i.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@anciens.enib.fr> writes:

 Yann> If building out-of-tree, add a Makefile wrapper that calls-out
 Yann> to the real Makefile with proper args.

 Yann> Avoids having to pass -C and O= every time we call make.

Nice, looks good.

 Yann> This is highly inspired from how the Linux kernel does it, and
 Yann> portions of it have been used.

Why only portions? Can't we use it all? That would make updating easier
in the future. Related to this, mkmakefile got updated in the kernel
back in August to support make 3.82, care to resync?

-- 
Bye, Peter Korsgaard
