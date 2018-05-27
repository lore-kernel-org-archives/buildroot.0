From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 May 2018 23:34:41 +0200
Subject: [Buildroot] [PATCH v3 1/6] libtirpc: add host package
In-Reply-To: <7a5dc74171a99cf6723c0fd759b8306910d3b088.1527097490.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Wed, 23 May 2018 20:44:45 +0300")
References: <7a5dc74171a99cf6723c0fd759b8306910d3b088.1527097490.git.baruch@tkos.co.il>
Message-ID: <87fu2cn5ou.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > The libtirpc host package is only for two headers that the host rpcgen
 > utility from the nfs-utils package needs to build. glibc used to provide
 > these headers. In version 2.26 glibc deprecated them with its bundled
 > Sun RPC. Recently Fedora stopped enabling Sun RPC in glibc. So we can no
 > longer rely on these headers being present on the host.

 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 > ---
 > v3: Use host-generic-package since we are not using anything from the
 >     autotools infrastructure (Arnout).

 > v2: New patch in this series

Committed all 6, thanks.

-- 
Bye, Peter Korsgaard
