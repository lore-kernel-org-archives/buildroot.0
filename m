From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Nov 2019 10:32:44 +0100
Subject: [Buildroot] [PATCH 2/3] package/gettext-tiny: fix gettext
 wrapper
In-Reply-To: <8c8ec4ace1add01c65a4d0e749cdec3661086a87.1573759321.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Thu, 14 Nov 2019 20:22:09 +0100")
References: <cover.1573759321.git.yann.morin.1998@free.fr>
 <8c8ec4ace1add01c65a4d0e749cdec3661086a87.1573759321.git.yann.morin.1998@free.fr>
Message-ID: <87r224nrcz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > When a textdomain is specified, we ignore it twice: we shift args, and
 > we printf ${2}, which would yield an empty printf.

 > Fix that by not shifting, and just printf ${2}; this is nicer.

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Vadim Kochan <vadim4j@gmail.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2019.08.x (not in 2019.02.x), thanks.

-- 
Bye, Peter Korsgaard
