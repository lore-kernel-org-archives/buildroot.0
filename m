From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 09 Apr 2014 00:46:42 +0200
Subject: [Buildroot] [PATCH 0/2] Misc icu fixes (branch yem/fixes)
In-Reply-To: <cover.1396993575.git.yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Tue, 8 Apr 2014 23:50:11 +0200")
References: <cover.1396993575.git.yann.morin.1998@free.fr>
Message-ID: <87vbuj8mnh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Hello All!

 > Here are two patch fixing reverse dependencies of icu: icu needs threads,
 > so a package that selects icu should depend on threads, too.

Committed, thanks.

 > There are other packages that select icu, but they already depend on
 > threads:
 >   - beecrypt directly depends on threads
 >   - cppcms depends on glibc, which always has threads

That's no longer true. I will fix it.

-- 
Bye, Peter Korsgaard
