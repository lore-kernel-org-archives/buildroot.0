From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 08 Dec 2018 20:52:29 +0100
Subject: [Buildroot] [PATCH] configs/aarch64_efi: Linux needs
 host-openssl to build
In-Reply-To: <20181208150130.4201-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sat, 8 Dec 2018 16:01:30 +0100")
References: <20181208150130.4201-1-thomas.petazzoni@bootlin.com>
Message-ID: <87ftv74wzm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > The Linux kernel builds fails with:
 > scripts/extract-cert.c:21:25: fatal error: openssl/bio.h: No such file or directory
 >  #include <openssl/bio.h>

 > Because it needs host-openssl.

 > Fixes:

 >   https://gitlab.com/buildroot.org/buildroot/-/jobs/131216892

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
