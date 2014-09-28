From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 28 Sep 2014 23:21:48 +0200
Subject: [Buildroot] [PATCH 4/4] package/vde2: does not build on static
	only, needs dlopen()
In-Reply-To: <6d21f6468575ab79a003b9f8542f23251b459123.1411921550.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sun, 28 Sep 2014 18:26:30 +0200")
References: <cover.1411921550.git.yann.morin.1998@free.fr>
 <6d21f6468575ab79a003b9f8542f23251b459123.1411921550.git.yann.morin.1998@free.fr>
Message-ID: <87d2afsaoj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Fixes:
 >     http://autobuild.buildroot.net/results/f9d/f9d23455a138e2214546922486c03c9d3c35b04a/

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
