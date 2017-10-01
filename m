From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 01 Oct 2017 23:16:55 +0200
Subject: [Buildroot] [PATCH] package/weston: fix build on musl
In-Reply-To: <20171001123216.31025-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Sun, 1 Oct 2017 14:32:16 +0200")
References: <20171001123216.31025-1-yann.morin.1998@free.fr>
Message-ID: <87mv5aefg8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > As usual, musl is more conservative than the alternatives, wrt to
 > headers that are internally included.

 > Fixes:
 >     http://autobuild.buildroot.org/results/a7a/a7a6b17dff09a45a35185a0e02704523b815dd57/

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
