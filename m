From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 13 Jun 2014 22:30:04 +0200
Subject: [Buildroot] [PATCH] kernel headers: remove deprecated version
	3.8
In-Reply-To: <bf13a7c05006c4236c99.1402687305@localhost> (Thomas De
 Schampheleire's message of "Fri, 13 Jun 2014 21:21:45 +0200")
References: <bf13a7c05006c4236c99.1402687305@localhost>
Message-ID: <8738f8eenn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > Kernel headers version 3.8.x has been deprecated since 2013.08 and thus can
 > be removed in 2014.08.
 > An automatic selection of 3.9.x headers is performed in the legacy menu.
 > Existing automatic selections of 3.8.x headers are modified to select
 > 3.9.x.

 > As this patch removes the last occurrence of BR2_DEPRECATED_SINCE_2013_08,
 > the symbol is removed too.

 > Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Committed, thanks.

It didn't apply to HEAD (because of the version bumps of last
wednesday), so I had to fix up the patch manually.

Please consider rebasing your patches before submitting.

-- 
Bye, Peter Korsgaard
