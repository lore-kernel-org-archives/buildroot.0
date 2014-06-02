From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 02 Jun 2014 08:42:13 +0200
Subject: [Buildroot] [PATCH] glibc: remove redundant version logic
In-Reply-To: <22d4afc12d7eb01dc41b9ac5e4cb3e25867d0073.1401680524.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Mon, 2 Jun 2014 06:42:04 +0300")
References: <22d4afc12d7eb01dc41b9ac5e4cb3e25867d0073.1401680524.git.baruch@tkos.co.il>
Message-ID: <87d2erzube.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Since commit 990a46fdec6a (glibc: move version handling to Config.in) we use
 > Config.in version strings. Remove glibc.mk duplicate.

Ups, yes - Committed, thanks.

-- 
Bye, Peter Korsgaard
