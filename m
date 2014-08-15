From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 16 Aug 2014 00:30:57 +0200
Subject: [Buildroot] [PATCH] package/webkit: select cairo,
	since we select one of its options
In-Reply-To: <1408135786-1195-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Fri, 15 Aug 2014 22:49:46 +0200")
References: <1408135786-1195-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87d2c11j32.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > When selecting an option of a package, that package must also be
 > selected, otherwise the package is not built.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
