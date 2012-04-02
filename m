From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 02 Apr 2012 23:28:44 +0200
Subject: [Buildroot] [PATCH] package/giblib: fix breakage
In-Reply-To: <1331852049-12761-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Thu, 15 Mar 2012 23:54:09 +0100")
References: <1331852049-12761-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87k41xesc3.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 Yann> Fix two things in the giblib package:
 Yann> 1- fix prefix breakage
 Yann>    - s/STAGING/STAGING_DIR/ (Thomas)
 Yann>    - prefix is .../usr, not .../usr/lib or .../usr/bin

 Yann> 2- fix the configure.ac/Makefile.am breakage
 Yann>    - imlib2 sets IMLIB2_(LIBS|CFLAGS), not IMLIB_(LIBS|CFLAGS)
 Yann>    - autoreconf the package, install missing files
 Yann>      Note that both configure.ac and configure.in are present in the
 Yann>      package, so both are fixed, although only configure.ac is used
 Yann>      (configure.in is the legacy name).

Committed, thanks.

-- 
Bye, Peter Korsgaard
