From: Petr Vorel <petr.vorel@gmail.com>
Date: Thu, 5 Mar 2020 05:37:08 +0100
Subject: [Buildroot] [PATCH 1/2] package/libtirpc: fix build with gcc 10
In-Reply-To: <20200228173052.5128-1-petr.vorel@gmail.com>
References: <20200228173052.5128-1-petr.vorel@gmail.com>
Message-ID: <20200305043708.GA2841817@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> This issue seems to be happening only on the next branch. Why? Anything
> special in next compared to master?
No idea why, libtirpc itself it's the same. It'd help if I could find builds for
master, but autobuild search doesn't help to search packages, which does not
fail, there is only search for failed packages:

http://autobuild.buildroot.net/index.php?reason=libtirpc-1.2.5

Is it running for master?

Kind regards,
Petr
