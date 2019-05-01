From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 01 May 2019 22:13:24 +0200
Subject: [Buildroot] [PATCH] package/imagemagick: security bump to
 version 7.0.8-42
In-Reply-To: <20190429213448.10806-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 29 Apr 2019 23:34:48 +0200")
References: <20190429213448.10806-1-peter@korsgaard.com>
Message-ID: <87pnp2exwb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > - CVE-2019-9956: In ImageMagick 7.0.8-35 Q16, there is a stack-based buffer
 >   overflow in the function PopHexPixel of coders/ps.c, which allows an
 >   attacker to cause a denial of service or code execution via a crafted
 >   image file.

 > - CVE-2019-10650: In ImageMagick 7.0.8-36 Q16, there is a heap-based buffer
 >   over-read in the function WriteTIFFImage of coders/tiff.c, which allows an
 >   attacker to cause a denial of service or information disclosure via a
 >   crafted image file.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
