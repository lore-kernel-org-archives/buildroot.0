From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Dec 2018 22:18:16 +0100
Subject: [Buildroot] [PATCH] package/liquid-dsp: add missing dependency
 on fftw
In-Reply-To: <20181212090458.15747-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Wed, 12 Dec 2018 10:04:58 +0100")
References: <20181212090458.15747-1-thomas.petazzoni@bootlin.com>
Message-ID: <87y38p5fxj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > When one of BR2_PACKAGE_FFTW_PRECISION_* is enabled, liquid-dsp links
 > against fftw3f, fftw3 or fftw3l, but forgets to add the fftw package
 > in its dependencies. It works fine in practice because "fftw" is
 > before "liquid-dsp" in the alphabetic ordering, but building with
 > "make liquid-dsp" or with per-package directory causes a build
 > failure.

 > Fix that by adding the missing dependencies.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.02.x, 2018.08.x and 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
