From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 18 Sep 2010 22:59:59 +0200
Subject: [Buildroot] [PATCH 2/3] zlib: Fix build
In-Reply-To: <AANLkTina7PCqWDL8=TL+kQv89=bnEj40Mw7dtrY5fF9a@mail.gmail.com>
	(Martin Banky's message of "Sat, 18 Sep 2010 13:48:11 -0700")
References: <1284812207-31798-1-git-send-email-llandwerlin@gmail.com>
	<1284812207-31798-3-git-send-email-llandwerlin@gmail.com>
	<8739t66ca0.fsf@macbook.be.48ers.dk>
	<AANLkTina7PCqWDL8=TL+kQv89=bnEj40Mw7dtrY5fF9a@mail.gmail.com>
Message-ID: <87vd624vjk.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Martin" == Martin Banky <Martin.Banky@gmail.com> writes:

 Martin> Peter,

 Martin> ???? I can confirm that it was reliably breaking for me with
 Martin> parallel builds.  The error message would say that it couldn't
 Martin> find libz.a, I think during linking. I would restart the build
 Martin> process, and it would finish just fine after that. I wish I had
 Martin> known about the MAKE1 option. I guess I should have rtfm a
 Martin> little better.

Hmm, interesting. I still haven't seen it here, but OK.

-- 
Bye, Peter Korsgaard
