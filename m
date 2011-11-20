From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 20 Nov 2011 21:55:18 +0100
Subject: [Buildroot] [PATCH] toolchain/crosstool-NG: update to 1.13.2
In-Reply-To: <1321822277-30212-1-git-send-email-yann.morin.1998@anciens.enib.fr>
 (Yann E. MORIN's message of "Sun, 20 Nov 2011 21:51:17 +0100")
References: <1321822277-30212-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <87ipmeqzt5.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@anciens.enib.fr> writes:

 Yann> crosstool-NG 1.13.2 contains an important fix related to building
 Yann> the ncurses libraries: the latest ncurses version requires tic to
 Yann> be either in ${TIC_PATH}, or to be exactly /usr/bin/tic.

Committed, thanks.

-- 
Bye, Peter Korsgaard
