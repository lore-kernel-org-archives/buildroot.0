From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 13 Jul 2011 08:36:43 +0200
Subject: [Buildroot] [PATCH 1/2] toolchain/crosstool-ng: allow
	pre-downloading the sources
In-Reply-To: <1310512066-11450-2-git-send-email-yann.morin.1998@anciens.enib.fr>
 (Yann E. MORIN's message of "Wed, 13 Jul 2011 01:07:45 +0200")
References: <1310512066-11450-1-git-send-email-yann.morin.1998@anciens.enib.fr>
 <1310512066-11450-2-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <87vcv6g004.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@anciens.enib.fr> writes:

 Yann> On "make source", just download the required sources, and do not
 Yann> build the entire toolchain. This requires a new patch against
 Yann> crosstool-NG (got from upstream).

 Yann> The "uclibc-source" rule requires an installed and configured
 Yann> crosstool-NG, so it has to be after the variables declaration.
 Yann> For consistency, move down the main rule "uclibc".

Committed, thanks.

-- 
Bye, Peter Korsgaard
