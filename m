From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 28 Sep 2014 23:17:12 +0200
Subject: [Buildroot] [PATCH 1/4] docs/manual: add musl to toolchain
	dependency options
In-Reply-To: <2ae3131118cfc155a94a2abf49d5bcdf3b5dba99.1411921550.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sun, 28 Sep 2014 18:26:27 +0200")
References: <cover.1411921550.git.yann.morin.1998@free.fr>
 <2ae3131118cfc155a94a2abf49d5bcdf3b5dba99.1411921550.git.yann.morin.1998@free.fr>
Message-ID: <87ppefsaw7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Currently, we only document (e)glibc and uClibc as C libraries on which
 > we can depend. However, we've supported musl for quite some time now.

 > So, also refference it in the manual, when dealing with toolchain
 > options a pa ckage may have to depend on.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > ---
 >  docs/manual/adding-packages-directory.txt | 2 +-
 >  1 file changed, 1 insertion(+), 1 deletion(-)

 > diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
 > index fd9460c..2e259ba 100644
 > --- a/docs/manual/adding-packages-directory.txt
 > +++ b/docs/manual/adding-packages-directory.txt
 > @@ -232,7 +232,7 @@ use in the comment.
 
 >  * C library
 >  ** Dependency symbol: +BR2_TOOLCHAIN_USES_GLIBC+,
 > -   +BR2_TOOLCHAIN_USES_UCLIBC+
 > +   +BR2_TOOLCHAIN_USES_UCLIBC+, +BR2_TOOLCHAIN_USES_MUSL+

Lets keep it sorted (so musl before uclibc).

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
