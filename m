From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 18 Jan 2019 15:55:27 +0100
Subject: [Buildroot] [PATCH 2/4] arch/arm: restrict more armv8a cores to
 aarch64
In-Reply-To: <891faf01bce122d52613f7fc831f32526beaa1a3.1546179362.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sun, 30 Dec 2018 15:16:11 +0100")
References: <cover.1546179362.git.yann.morin.1998@free.fr>
 <891faf01bce122d52613f7fc831f32526beaa1a3.1546179362.git.yann.morin.1998@free.fr>
Message-ID: <87bm4e3ti8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Since gcc-8, falkor and qdf24xx have been available only as AArch64.
 > Although we could support building in 32-bit for older gcc versions, we
 > decided not to, in the sake of simplicity.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.02.x and 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
