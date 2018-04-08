From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 08 Apr 2018 21:47:42 +0200
Subject: [Buildroot] [PATCH] download/git: don't require too-recent git
In-Reply-To: <20180408154811.27234-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Sun, 8 Apr 2018 17:48:11 +0200")
References: <20180408154811.27234-1-yann.morin.1998@free.fr>
Message-ID: <87tvsl8opt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > git has supported -C only since 1.8.5, and some distros have not yet
 > caught up after moe than 4 years...

 > Fall back to entering the directory.

 > Fixes:
 >     http://autobuild.buildroot.net/results/35f9f7a4adc6c2cad741079e4afdf1408c94703b

 > Reported-by: Andr? Hentschel <nerv@dawncrow.de>
 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
 > Cc: Andr? Hentschel <nerv@dawncrow.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
