From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 28 Jan 2014 23:39:27 +0100
Subject: [Buildroot] [PATCH] libusb: disable udev support for host
	variant
In-Reply-To: <1390947851-11705-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 28 Jan 2014 19:24:11 -0300")
References: <1390947851-11705-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <874n4nzq74.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > There's no guarantee that udev with development files is present in the
 > host, so disable it. Fixes:
 > http://autobuild.buildroot.net/results/7bb/7bbf6ec25250dea96503253ac468adfef77a9010/

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
