From: g4 at novadsp.com <g4@novadsp.com>
Date: Wed, 27 May 2015 14:55:20 +0100
Subject: [Buildroot] B3 questions with 4.0.4
In-Reply-To: <049c01d09881$9a3b3900$ceb1ab00$@novadsp.com>
References: <049c01d09881$9a3b3900$ceb1ab00$@novadsp.com>
Message-ID: <04c401d09884$c57c7f40$50757dc0$@novadsp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Specifically I am now getting:

 

make[1]: Leaving directory
`/home/moi/buildroot/output/build/linux-headers-4.0.4'

if ! support/scripts/check-kernel-headers.sh  /home/ moi
/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnuea

bihf/sysroot  3.18; then exit 1; fi

Incorrect selection of kernel headers: expected 3.18.x, got 4.0.x

make: *** [/home/ moi
/buildroot/output/build/linux-headers-4.0.4/.stamp_staging_installed] Error
1

 

From: buildroot [mailto:buildroot-bounces at busybox.net] On Behalf Of
g4 at novadsp.com
Sent: 27 May 2015 14:33
To: buildroot at buildroot.org
Subject: [Buildroot] B3 questions with 4.0.4

 

The BR .config is set up to use a custom kernel (4.0.4) and source from a
custom location. This all works fine for 3.XX varieties but hits the buffers
for 4.XX

 

Not quite sure I'm understanding the purpose of the
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM? If I am using 4.0.4, then will
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM=3.18.x work? Why are there 2 settings
that are apparently related but disconnected. And how come no manually
specified version for this.

 

TVMIA.

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150527/0fcbee60/attachment.html>
