From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Dec 2016 22:17:50 +0100
Subject: [Buildroot] [PATCH] wireshark: fix build with musl
In-Reply-To: <05c8bbf9134c0689d002e446c144eaadc99ccfec.1483039016.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Thu, 29 Dec 2016 21:16:56 +0200")
References: <05c8bbf9134c0689d002e446c144eaadc99ccfec.1483039016.git.baruch@tkos.co.il>
Message-ID: <877f6h86bl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Add a patch adding missing sys/time.h header.
 > Fixes:
 > http://autobuild.buildroot.net/results/cd8/cd883b40503a6f4d3035e09a383db2d5a21162ad/
 > http://autobuild.buildroot.net/results/1ae/1ae34debe7e95eab33a895ecdf04c0ddf96cf4ab/
 > http://autobuild.buildroot.net/results/4af/4afe968e698f62c6bdbec35e53d35c361c5e852b/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
