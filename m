From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Jul 2018 09:25:56 +0200
Subject: [Buildroot] [PATCH] cifs-utils: disable man page generation
In-Reply-To: <cfb08d3dc87c476e1d0f7a826a9aee914017fb67.1528046904.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Sun, 3 Jun 2018 20:28:24 +0300")
References: <cfb08d3dc87c476e1d0f7a826a9aee914017fb67.1528046904.git.baruch@tkos.co.il>
Message-ID: <874lgypbln.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Buildroot does not generate documentation for target.
 > This fixes the build on hosts where the rst2man command does not support
 > the --syntax-highlight parameter.

 > Fixes:
 > http://autobuild.buildroot.net/results/265/2655c0e1fa3ad0a10b4aed39a17feead94e47bfb/
 > http://autobuild.buildroot.net/results/92d/92d7c608f717bbfe01ecfb9bc9604cb303d8594c/
 > http://autobuild.buildroot.net/results/4b9/4b95404a89a595ca9c1e3df912169e9d36ff2bd7/

 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2018.05.x, thanks.

-- 
Bye, Peter Korsgaard
