From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Jul 2017 22:16:20 +0200
Subject: [Buildroot] [PATCH 1/4 v2] arch/arm: fix -mcpu default values
	for AArch64
In-Reply-To: <cbd726c5aa26ea8278c518508ba76efc5b796f7a.1499522760.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sat, 8 Jul 2017 16:08:36 +0200")
References: <cover.1499522760.git.yann.morin.1998@free.fr>
 <cbd726c5aa26ea8278c518508ba76efc5b796f7a.1499522760.git.yann.morin.1998@free.fr>
Message-ID: <87a8405giz.fsf@dell.be.48ers.dk>
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

 > ---
 > Changes v1 -> v2:
 >   - squash the two changes into one patch  (Thomas)
 >   - remove useless parentheses  (Baruch)
 >   - remove superfluous indentation

Committed to 2017.02.x and 2017.05.x, thanks.

-- 
Bye, Peter Korsgaard
