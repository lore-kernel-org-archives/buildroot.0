From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 11 Jun 2008 09:55:20 +0200
Subject: [Buildroot] kernel image size depends on toolchain?
In-Reply-To: <484F8157.2050902@gin.de> (Andreas Kuehn's message of "Wed\,
	11 Jun 2008 09\:40\:07 +0200")
References: <484F8157.2050902@gin.de>
Message-ID: <87hcc0pfrr.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Andreas" == Andreas Kuehn <Andreas.Kuehn@gin.de> writes:

Hi,

 Andreas> Created:      Tue Jun 10 11:45:43 2008
 Andreas> Image Type:   ARM Linux Kernel Image (uncompressed)
 Andreas> Data Size:    4528112 Bytes = 4421.98 kB = 4.32 MB

 Andreas> With an old toolchain I can achive regular sizes:

 Andreas> Created:      Tue Jun 10 13:44:26 2008
 Andreas> Image Type:   ARM Linux Kernel Image (uncompressed)
 Andreas> Data Size:    1412792 Bytes = 1379.68 kB = 1.35 MB

Strange. And you are sure you're using the exact same kernel config?
Do both kernel images boot?

-- 
Bye, Peter Korsgaard
