From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 19 May 2014 00:36:19 +0200
Subject: [Buildroot] [PATCH v2] Makefile: move fs/common.mk above
	external.mk
In-Reply-To: <d407527a4c853dd989fb.1399276333@argentina> (Thomas De
 Schampheleire's message of "Mon, 05 May 2014 09:52:13 +0200")
References: <d407527a4c853dd989fb.1399276333@argentina>
Message-ID: <87a9aelnoc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > From: Philippe Reynes <tremyfr@yahoo.fr>
 > The file external.mk was included before fs/common.mk, so it was impossible
 > to add rootfs targets using the BR2_EXTERNAL mechanism.
 > This change moves the inclusion of fs/common.mk before external.mk to allow
 > this.

 > Signed-off-by: Philippe Reynes <tremyfr@yahoo.fr>
 > [ThomasDS: rebased, update commit message]
 > Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

 > ---
 > v2: rebased, update commit message

Committed, thanks.

-- 
Bye, Peter Korsgaard
