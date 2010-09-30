From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 30 Sep 2010 23:12:59 +0200
Subject: [Buildroot] [PATCH 1/2] host tools: create the host sed in
	$(O)/host/
In-Reply-To: <1284926049-9882-2-git-send-email-yann.morin.1998@anciens.enib.fr>
	(Yann E. MORIN's message of "Sun, 19 Sep 2010 21:54:08 +0200")
References: <1284926049-9882-1-git-send-email-yann.morin.1998@anciens.enib.fr>
	<1284926049-9882-2-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <87bp7fx7dw.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@anciens.enib.fr> writes:

 Yann> The host sed does not belong to $(O)toolchain/ but
 Yann> really belongs to $(O)/host/

Thanks, but this is broken (and so was what we had), so I prefer to just
get rid of it - It's not difficult to install a working sed on your
build machine.

-- 
Bye, Peter Korsgaard
