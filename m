From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 07 Aug 2011 23:19:03 +0200
Subject: [Buildroot] [PATCH 0/2] toolchain: update the crosstool-NG
	backend, v2
In-Reply-To: <1312749478-10361-1-git-send-email-yann.morin.1998@anciens.enib.fr>
 (Yann E. MORIN's message of "Sun, 7 Aug 2011 22:37:56 +0200")
References: <1312749478-10361-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <87oc00ly2g.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@anciens.enib.fr> writes:

 Yann> Hello All!

 Yann> This patchset updates the crosstool-NG backend to the newly
 Yann> released 1.12.0.  Existing patches were applied upstream, and are
 Yann> no longer needed. A new patch is added because it works around a
 Yann> limitation specific to buildroot; it will not go upstream as-is,
 Yann> a better fix will have to be found.

 Yann> Changes since v1:
 Yann> - simply get rid of the recursion test, it can't happen (Peter)

Committed, thanks.

-- 
Bye, Peter Korsgaard
