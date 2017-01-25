From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Jan 2017 22:27:22 +0100
Subject: [Buildroot] [PATCH] eudev: drop obsolete --with-firmware-path
	configure flag
In-Reply-To: <20170125140510.30271-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 25 Jan 2017 15:05:10 +0100")
References: <20170125140510.30271-1-peter@korsgaard.com>
Message-ID: <87mveeg79h.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > As recently discussed on the list:
 > http://lists.busybox.net/pipermail/buildroot/2017-January/182147.html

 > eudev no longer has legacy user space firmware loading and the
 > --with-firmware-path configure flag since the 3.1.3 release:

 > commit 3b717594600fa717cdf9bcfd0c7c1b703b245482
 > Author: Kay Sievers <kay@vrfy.org>
 > Date:   Mon Sep 1 09:07:49 2014 -0400

 >     udev: remove userspace firmware loading support

 >     Signed-off-by: Anthony G. Basile <blueness@gentoo.org>

 > So drop it from EUDEV_CONF_OPTS to limit confusion.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
