From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 24 Jun 2013 13:40:50 +0200
Subject: [Buildroot] [PATCH] libserial: prevent documentation from being
	build
In-Reply-To: <1371812010-9902-1-git-send-email-richard.genoud@gmail.com>
 (Richard Genoud's message of "Fri, 21 Jun 2013 12:53:30 +0200")
References: <1371812010-9902-1-git-send-email-richard.genoud@gmail.com>
Message-ID: <87sj07ivnh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Richard" == Richard Genoud <richard.genoud@gmail.com> writes:

 Richard> If docbook2pdf is present on the host, the documentation is built, no
 Richard> matter all the --disable-doc*
 Richard> But forcing ac_cv_prog_DOCBOOK2PDF to no tells configure that
 Richard> docbook2pdf is absent, and thus the documentation is not built.

Committed, thanks.

-- 
Bye, Peter Korsgaard
