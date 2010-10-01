From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 01 Oct 2010 16:44:14 +0200
Subject: [Buildroot] [PATCH 2/2] toolchain: add new toolchain backend:
	crosstool-NG
In-Reply-To: <1284926049-9882-3-git-send-email-yann.morin.1998@anciens.enib.fr>
	(Yann E. MORIN's message of "Sun, 19 Sep 2010 21:54:09 +0200")
References: <1284926049-9882-1-git-send-email-yann.morin.1998@anciens.enib.fr>
	<1284926049-9882-3-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <87d3ruvupt.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@anciens.enib.fr> writes:

 Yann> Signed-off-by: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>

Committed, thanks a lot!

I fixed a few minor things (Config.in should be indented with tabs, we
normally don't use a seperate prompt ".." line, and shuffled the make
targets around slightly so they follow the logic flow
(download/extract/patch/configure/build/.. rather than the other way
around).

I've noticed that you're not propagating some of the toolchain options
(like wchar) to ct-ng, but we can add that later.

-- 
Bye, Peter Korsgaard
