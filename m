From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Dec 2019 22:11:48 +0100
Subject: [Buildroot] [PATCH] configs/beaglebone: kernel builds needs
 host-openssl
In-Reply-To: <20191216100548.1752628-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Mon, 16 Dec 2019 11:05:48 +0100")
References: <20191216100548.1752628-1-thomas.petazzoni@bootlin.com>
Message-ID: <87lfrc2cx7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Fixes:
 > 514 scripts/extract-cert.c:21:25: fatal error: openssl/bio.h: No such file or directory
 > 515  #include <openssl/bio.h>

 > Seen at:

 >   https://gitlab.com/buildroot.org/buildroot/-/jobs/378314247

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
