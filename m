From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Tue, 31 Aug 2010 14:52:34 +0000 (UTC)
Subject: [Buildroot] libssp missing from target
Message-ID: <i5j4vi$oj9$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I just added a package (systemtap) that uses libssp.  I find libssp.so
et al. are present in output/staging/lib but missing from
output/target/lib. Is there something I need to do in my package
makefile to tell buildroot that my package needs libssp to be copied
from staging into target?

-- 
Grant Edwards               grant.b.edwards        Yow! My NOSE is NUMB!
                                  at               
                              gmail.com            
