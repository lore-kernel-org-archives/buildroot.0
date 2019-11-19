From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Nov 2019 10:32:37 +0100
Subject: [Buildroot] [PATCH 1/3] package/gettext-tiny: fix prefix in
 autopoint
In-Reply-To: <65fdd6f7c3a5900df8ab25d291fe29293f95b43c.1573759321.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Thu, 14 Nov 2019 20:22:08 +0100")
References: <cover.1573759321.git.yann.morin.1998@free.fr>
 <65fdd6f7c3a5900df8ab25d291fe29293f95b43c.1573759321.git.yann.morin.1998@free.fr>
Message-ID: <87v9rgnrd6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > gettext-tiny also installs a fake autopoint, but it still needs to be
 > pointed at the m4 macros, which the template autopoint expects to be in
 > @datadir@, where datadir is the traditional autotools datadir, derived
 > from datarootdir, itself derived from prefix.

 > So, pass prefix so all the locations are properly pointing to HOST_DIR,
 > instead of the default /usr/local.

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Vadim Kochan <vadim4j@gmail.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2019.08.x (not in 2019.02.x), thanks.

-- 
Bye, Peter Korsgaard
