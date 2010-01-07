From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Thu, 7 Jan 2010 22:17:40 +0000 (UTC)
Subject: [Buildroot] Where is mtd/mtd-user.h supposed to come from?
References: <hi55gi$ol6$1@ger.gmane.org>
Message-ID: <hi5mi4$ngt$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2010-01-07, Grant Edwards <grant.b.edwards@gmail.com> wrote:

> The build of uboot's fw_env target tool is failing because
> there is no mtd/mtd-user.h file.

Manually copying the mtd directory from the kernel headers into
the toolchain /usr/include directory allows mtd stuff to build.
I don't know how to get buildroot to do that when it's building
a toolchain.

Though the mtd programs build, they still wonn't run, since
libgcc_s is missing, but more on that in another thread...

-- 
Grant Edwards                   grante             Yow! PUNK ROCK!!  DISCO
                                  at               DUCK!!  BIRTH CONTROL!!
                               visi.com            
