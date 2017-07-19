From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Jul 2017 15:59:51 +0200
Subject: [Buildroot] [PATCH 1/4 v3] arch/arm: fix -mcpu default values
	for AArch64
In-Reply-To: <cbd726c5aa26ea8278c518508ba76efc5b796f7a.1499592591.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sun, 9 Jul 2017 11:29:58 +0200")
References: <cover.1499592591.git.yann.morin.1998@free.fr>
 <cbd726c5aa26ea8278c518508ba76efc5b796f7a.1499592591.git.yann.morin.1998@free.fr>
Message-ID: <871spca5ns.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > We have to specify the -mcpu value, even in 64-bit mode.
 > For AArch64, +fp and +simd are the default, so they are totally useless.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Cc: Baruch Siach <baruch@tkos.co.il>

Is this a candidate for 2017.02.x / 2017.05.x - In other words, what
does it fix?

-- 
Bye, Peter Korsgaard
