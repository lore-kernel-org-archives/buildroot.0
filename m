From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 21 May 2014 13:14:50 +0200
Subject: [Buildroot] [PATCH] wpa_supplicant: fix internal TLS
	implementation security issues
In-Reply-To: <3d007c49bd84753f091cf084fa01f6ad21450935.1400666040.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Wed, 21 May 2014 12:54:00 +0300")
References: <3d007c49bd84753f091cf084fa01f6ad21450935.1400666040.git.baruch@tkos.co.il>
Message-ID: <87r43ne639.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Add upstream patches fixing internal TLS validation of X.509 certificates. See
 > http://lists.shmoo.com/pipermail/hostap/2014-May/030273.html for details.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
