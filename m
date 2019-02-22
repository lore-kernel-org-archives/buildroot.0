From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Feb 2019 22:26:12 +0100
Subject: [Buildroot] [PATCH] configs/rock64: Linux needs host OpenSSL
In-Reply-To: <20190222205305.5097-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Fri, 22 Feb 2019 21:53:04 +0100")
References: <20190222205305.5097-1-thomas.petazzoni@bootlin.com>
Message-ID: <87d0njikgb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > The Linux configuration used in the rock64_defconfig requires
 > host-openssl to be built, otherwise the build fails with:

 > scripts/extract-cert.c:21:25: fatal error: openssl/bio.h: No such file or directory
 >  #include <openssl/bio.h>

 > So let's enable BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL.

 > Fixes:

 >   https://gitlab.com/buildroot.org/buildroot/-/jobs/165766161

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
