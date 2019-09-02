From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Sep 2019 17:34:14 +0200
Subject: [Buildroot] [PATCH] package/pigpio: install to staging
In-Reply-To: <20190815134322.31823-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Thu, 15 Aug 2019 15:43:21 +0200")
References: <20190815134322.31823-1-thomas.petazzoni@bootlin.com>
Message-ID: <8736he3e6h.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > The pigpio package installs programs and libraries to target, but does
 > not install the libraries and its headers to staging, while they may
 > be used by other packages. Let's install them, as was requested in bug

 > Fixes:

 >   https://bugs.busybox.net/show_bug.cgi?id=11741

 > Cc: vishalbhalani89 at gmail.com
 > Cc: ivan.nazarenko at gmail.com
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2019.02.x and 2019.05.x, thanks.

-- 
Bye, Peter Korsgaard
