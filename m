From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 14 Apr 2010 17:05:20 +0200
Subject: [Buildroot] [PATCH 0/2] Couple fixes for X11 Intel driver
	compilation
In-Reply-To: <20100414122805.17586.64124.stgit@localhost.localdomain> (Paulius
	Zaleckas's message of "Wed, 14 Apr 2010 15:30:43 +0300")
References: <20100414122805.17586.64124.stgit@localhost.localdomain>
Message-ID: <871veif51r.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Paulius" == Paulius Zaleckas <paulius.zaleckas@gmail.com> writes:

 Paulius> X11 Intel driver compilation was broken since libdrm had no
 Paulius> support for Intel driver enabled. It was disabled because libdrm
 Paulius> needs libatomic_ops library.

Committed, thanks.

-- 
Bye, Peter Korsgaard
