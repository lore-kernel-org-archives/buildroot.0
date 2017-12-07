From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 07 Dec 2017 22:39:41 +0100
Subject: [Buildroot] [PATCH] arch/arm: default to Cortex-A53 for AArch64
In-Reply-To: <20171204204331.2007-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Mon, 4 Dec 2017 21:43:31 +0100")
References: <20171204204331.2007-1-yann.morin.1998@free.fr>
Message-ID: <87374m2p5u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Since we re-organised the list of cores (in 52d500aa35) and introduced
 > some new cores (in e9960da6ec, d632d9e5a9, 6317a199ec), the default for
 > AArch64 has changed from A53 to A35.

 > So, restore the default to A53 for AArch64.

 > Reported-by: daggs <daggs@gmx.com>
 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: daggs <daggs@gmx.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
