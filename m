From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 29 Aug 2018 07:21:45 +0200
Subject: [Buildroot] [PATCH] json-c: drop host-autoconf dependency
In-Reply-To: <2bff97fa66f9975195481b9b11f1a0688a855d8e.1535515629.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Wed, 29 Aug 2018 07:07:09 +0300")
References: <2bff97fa66f9975195481b9b11f1a0688a855d8e.1535515629.git.baruch@tkos.co.il>
Message-ID: <87wos94uja.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > It turns out that the configure script attempts to run autoheader
 > because the configure.ac timestamp is slightly later than that of
 > config.h.in. Update the config.h.in timestamp after tarball extract to
 > avoid autoheader run. With that we can drop the host-autoconf
 > dependency.

 > Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks both.

-- 
Bye, Peter Korsgaard
