From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 17:52:47 +0200
Subject: [Buildroot] [PATCH v3 1/3] support/scripts/pkg-stats: use
 aiohttp for latest version retrieval
In-Reply-To: <20200808180826.1007656-2-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sat, 8 Aug 2020 20:08:23 +0200")
References: <20200808180826.1007656-1-thomas.petazzoni@bootlin.com>
 <20200808180826.1007656-2-thomas.petazzoni@bootlin.com>
Message-ID: <87k0xiwywg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > This commit reworks the code that retrieves the latest upstream
 > version of each package from release-monitoring.org using the aiohttp
 > module. This makes the implementation much more elegant, and avoids
 > the problematic multiprocessing Pool which is causing issues in some
 > situations.

 > Since we're now using some async functionality, the script is Python
 > 3.x only, so the shebang is changed to make this clear.

 > Suggested-by: Titouan Christophe <titouan.christophe@railnova.eu>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
