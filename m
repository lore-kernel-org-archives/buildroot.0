From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 14 Mar 2012 23:33:25 +0100
Subject: [Buildroot] [PATCH 1/2] package/libxml2: fix breakage due to
	unordered patches
In-Reply-To: <1331762901-25245-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Wed, 14 Mar 2012 23:08:20 +0100")
References: <1331762901-25245-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <8762e6ke2y.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 Yann> Depending on the locale, the patches may get sorted in different order
 Yann> because they are not numbered. Also, even with the C locale (LC_ALL=C),
 Yann> the second patch that gets applied is error-xpath.patch, but it depends
 Yann> on other xpath patches to be applied first.

 Yann> Rename the patches so they are numbered and they get applied in order.
 Yann> Even then, some patches apply with offsets.

Sorry, I already fixed that locally and pushed - Thanks.

-- 
Bye, Peter Korsgaard
