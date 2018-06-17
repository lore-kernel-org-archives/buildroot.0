From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Jun 2018 16:56:15 +0200
Subject: [Buildroot] [PATCH v2 1/6] libtirpc: add host package
In-Reply-To: <176e048d628384df6d3b2d82f2b9c7e4cf58892e.1526985017.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 22 May 2018 13:30:12 +0300")
References: <176e048d628384df6d3b2d82f2b9c7e4cf58892e.1526985017.git.baruch@tkos.co.il>
Message-ID: <87sh5ltqb4.fsf@dell.be.48ers.dk>
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
 > v2: New patch in this series

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
