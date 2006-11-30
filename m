From: Pavel Roskin <proski@gnu.org>
Date: Thu, 30 Nov 2006 11:16:01 -0500
Subject: [Buildroot] Problem building uClib in buildroot
In-Reply-To: <20061130144934.271530@gmx.net>
References: <20061130144934.271530@gmx.net>
Message-ID: <1164903361.3780.1.camel@dv>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2006-11-30 at 15:49 +0100, Real.Magic at gmx.de wrote:
> I have downloaded buildroot-20061130.tar.bz2, extracted it to my
> working folder, and configured by using "make menuconfig" to use no
> daily snapshot of uClib, kernel headers 2.6.18, binutils 2.17 and gcc
> 4.0.3.

The released uClibc is incompatible with the Linux 2.6.18 header.
Please use older Linux headers.  2.6.12 is OK.

-- 
Regards,
Pavel Roskin
