From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Feb 2019 12:46:26 +0100
Subject: [Buildroot] [PATCH] linux: don't check hashes for user-supplied
 patches
In-Reply-To: <20190216183426.17548-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Sat, 16 Feb 2019 19:34:26 +0100")
References: <20190216183426.17548-1-yann.morin.1998@free.fr>
Message-ID: <87zhqokpv1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > We have virtually no way to know the hashes for user-supplied patches,
 > so we should just ignore them.

 > Reported-by: Simon van der Veldt <simon.vanderveldt@gmail.com>
 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Cc: Arnout Vandecappelle <arnout@mind.be>
 > Cc: Peter Korsgaard <peter@korsgaard.com>

 > ---
 > Peter: this is a candidate for backporting to 2018.11.x and 2018.02.x

Committed to 2018.02.x and 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
