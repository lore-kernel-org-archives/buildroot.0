From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Thu, 7 Jan 2010 17:26:42 +0000 (UTC)
Subject: [Buildroot] Where is mtd/mtd-user.h supposed to come from?
Message-ID: <hi55gi$ol6$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The build of uboot's fw_env target tool is failing because
there is no mtd/mtd-user.h file.

Where is the mtd include directory supposed to come from?

Is it supposed to come from the kernel-headers or from the mtd
package?

It's present in both, but never gets copied into the toolchain
include tree when the toolchainis built, nor into the staging
include tree when mtd is built.

-- 
Grant Edwards                   grante             Yow! Hmmm ... A hash-singer
                                  at               and a cross-eyed guy were
                               visi.com            SLEEPING on a deserted
                                                   island, when ...
