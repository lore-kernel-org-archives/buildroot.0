From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 05 Oct 2011 16:47:08 +0200
Subject: [Buildroot] [PATCH 1/2] toolchain/gdb: strip tarball component
	when extracting
In-Reply-To: <1315951050-19272-2-git-send-email-yann.morin.1998@anciens.enib.fr>
 (Yann E. MORIN's message of "Tue, 13 Sep 2011 23:57:29 +0200")
References: <1315951050-19272-1-git-send-email-yann.morin.1998@anciens.enib.fr>
 <1315951050-19272-2-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <87vcs3pkb7.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@anciens.enib.fr> writes:

 Yann> For some tarballs of gdb (see next patch), the extracted directory is
 Yann> *not* named after the version string (eg. gdb-6.6a extract into gdb-6.6/)

 Yann> Create the appropriate directory first, then use --strip-{components,path}
 Yann> when extracting gdb (the same way it is done for the generic package
 Yann> infrastructure).

 Yann> At the same time, get rid of the snapshot special case, because:
 Yann>  1- it's no longer available in the menu
 Yann>  2- it would be handled by the above change

Committed, thanks.

-- 
Bye, Peter Korsgaard
