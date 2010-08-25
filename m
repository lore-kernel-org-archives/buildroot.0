From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 25 Aug 2010 17:12:03 +0200
Subject: [Buildroot] [PATCH] gcc 4.2.4: Fix builds for i686 when headers
	are not present.
In-Reply-To: <1281652484-27944-1-git-send-email-raj.khem@gmail.com> (Khem
	Raj's message of "Thu, 12 Aug 2010 15:34:44 -0700")
References: <1281652484-27944-1-git-send-email-raj.khem@gmail.com>
Message-ID: <87r5hmwwu4.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Khem" == Khem Raj <raj.khem@gmail.com> writes:

 Khem> with this I could reproduce this issue. Here is a patch for gcc
 Khem> that will get you over this hump drop it into toolchain/gcc/4.2.4/
 Khem> and rebuild the first problem will be ok. The problem with locales
 Khem> is a separate issue and is not related to the toolchain build
 Khem> sequence change.

 Khem> If this works Then consider applying this patch to BR

Committed, thanks.

-- 
Bye, Peter Korsgaard
