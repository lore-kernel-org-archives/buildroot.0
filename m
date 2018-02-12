From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 12 Feb 2018 16:53:19 +0100
Subject: [Buildroot] Custom package using buildroot-linux-uclibc-g++
In-Reply-To: <1518432443635-0.post@n4.nabble.com>
References: <1518432443635-0.post@n4.nabble.com>
Message-ID: <20180212165319.2d80d5e3@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 12 Feb 2018 03:47:23 -0700 (MST), AAlex_ wrote:

> i created a custom package like the libfoo example.
> Using $(eval $(generic-package))
> The makefile extracts objects from archive and should link them to a so.
> Buildroot is using x86_64-buildroot-linux-uclibc-gcc but this doesnt work
> (source is c++). 
> How can i define that the x86_64-buildroot-linux-uclibc-g++ (which is
> availalble in host/bin) is used instead of the
> x86_64-buildroot-linux-uclibc-gcc for this package?

Use TARGET_CXX instead of TARGET_CC. But without seeing your actual
package .mk file it is hard to say. Could you post your .mk file ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
