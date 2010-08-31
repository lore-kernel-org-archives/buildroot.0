From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Tue, 31 Aug 2010 16:20:23 +0000 (UTC)
Subject: [Buildroot] libssp missing from target
References: <i5j4vi$oj9$1@dough.gmane.org>
Message-ID: <i5ja47$il4$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2010-08-31, Grant Edwards <grant.b.edwards@gmail.com> wrote:

> I just added a package (systemtap) that uses libssp.  I find libssp.so
> et al. are present in output/staging/lib but missing from
> output/target/lib. Is there something I need to do in my package
> makefile to tell buildroot that my package needs libssp to be copied
> from staging into target?

I just enabled building of gdbserver for the target, and now it's
missing a libarary on the target as well (libthread_db).

How do I tell buildroot to copy to output/target the libraires
required by the binaries in output/target/usr/bin?

-- 
Grant Edwards               grant.b.edwards        Yow! Jesus is my POSTMASTER
                                  at               GENERAL ...
                              gmail.com            
