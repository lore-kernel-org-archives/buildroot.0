From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 04 Jun 2014 22:59:27 +0200
Subject: [Buildroot] [PATCH] package/w_scan: needs kernel headers >= 3.3
In-Reply-To: <1401913475-2483-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Wed, 4 Jun 2014 22:24:35 +0200")
References: <1401913475-2483-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87ha40pf0v.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > w_scan needs SYS_DVBC_ANNEX_C, introduced in Linux 3.3.

 > Fixes:
 >     http://autobuild.buildroot.net/results/143/143960dc6de5377567dd2a383becc5a7bca90b41/

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
