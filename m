From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Nov 2016 23:44:58 +0100
Subject: [Buildroot] [PATCH v2 next] uclibc-ng-test: new package
In-Reply-To: <20161118060348.GA11282@waldemar-brodkorb.de>
References: <20161118060348.GA11282@waldemar-brodkorb.de>
Message-ID: <20161121234458.5dd3bf38@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 18 Nov 2016 07:03:48 +0100, Waldemar Brodkorb wrote:

> +	  Enabling this option will compile and install the uClibc-ng test suite.
> +	  This is useful if you want to check if the uClibc-ng library is working
> +	  for your architecture and/or help developing uClibc-ng.
> +
> +	  The test suite will be installed into /usr/lib/uclibc-ng-test directory.
> +	  To run the test suite enter the /usr/lib/uclibc-ng-test/test directory
> +	  and type "sh uclibcng-testrunner.sh".
> +
> +	  See the /usr/lib/uclibc-ng-test/test/README for additional information.
> +
> +	  This is not needed at all for normal builds, so you can safely say no
> +	  if you do not plan to dig into your C library.

The lines in this help text were too long, so I rewrapped them, and
applied your patch to our next branch. Thanks!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
