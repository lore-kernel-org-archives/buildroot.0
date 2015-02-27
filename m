From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Feb 2015 09:32:54 +0100
Subject: [Buildroot] [PATCH] bdwgc: bump to version 7.4.2
In-Reply-To: <7011f19afdf57c5c52fea635aed911e6c77f7eb5.1425016029.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Fri, 27 Feb 2015 07:47:09 +0200")
References: <7011f19afdf57c5c52fea635aed911e6c77f7eb5.1425016029.git.baruch@tkos.co.il>
Message-ID: <87oaof3gax.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > The code in gcconfig.h indicates that the list of supported architectures is
 > now a superset of BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS so we can drop
 > BR2_PACKAGE_BDWGC_ARCH_SUPPORTS.

 > Also, add a hash file.

 > Cc: Pedro Aguilar <paguilar@paguilar.org>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

You didn't generate this against next, so I had to fix it up a bit.

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
