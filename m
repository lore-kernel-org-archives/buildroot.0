From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 27 Jun 2010 23:08:49 +0200
Subject: [Buildroot] [PATCH 5/5] toolchain: rename base target for
	external toolchains
In-Reply-To: <1277504132-11184-6-git-send-email-yann.morin.1998@anciens.enib.fr>
	(Yann E. MORIN's message of "Sat, 26 Jun 2010 00:15:32 +0200")
References: <1277504132-11184-1-git-send-email-yann.morin.1998@anciens.enib.fr>
	<1277504132-11184-6-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <87sk482nfi.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@anciens.enib.fr> writes:

 Yann> It is misleeading to name the external toolchain make target 'uclibc', as
 Yann> external toochains can be based on other C libraries (eg. glibc or eglibc).

Typo - s/toochains/toolchains/

Otherwise looks good.

-- 
Bye, Peter Korsgaard
