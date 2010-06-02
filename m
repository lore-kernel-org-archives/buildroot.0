From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 02 Jun 2010 23:07:52 +0200
Subject: [Buildroot] [pull request] Preparatory work on toolchains
In-Reply-To: <1275429183-8974-1-git-send-email-yann.morin.1998@anciens.enib.fr>
	(Yann E. MORIN's message of "Tue, 1 Jun 2010 23:52:58 +0200")
References: <1275429183-8974-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <87zkzd5ejb.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@anciens.enib.fr> writes:

 Yann> The following changes since commit 4a640e464439a5e78458ae969dcc6017aa96278f:
 Yann>   Peter Korsgaard (1):
 Yann>         docs/news.html: add 2010.05 announcement

 Yann> are available in the git repository at:

 Yann>   git://git.busybox.net/~ymorin/git/buildroot master

 Yann> These are preparatory work on toolchain, laying ground to later add
 Yann> crosstool-NG as a backend. Currently, these are rather an RFC, even
 Yann> if it works OK for me.

 Yann> Yann E. MORIN (5):
 Yann>       toolchain: move helper functions from external toolchain
 Yann>       toolchain: rename external toolchain dir
 Yann>       toolchain: move makefile includes
 Yann>       toollchain: move buildroot config files
 Yann>       toolchain: rename base target for external toolchains

Thanks. With all those renames the patches gets a lot easier to review
if you create them with -M (detect renames). Could you resend, please?

-- 
Bye, Peter Korsgaard
