From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 01 Jun 2017 16:22:07 +0200
Subject: [Buildroot] [PATCH 1/1] package/flashrom: security bump to
	version 0.9.9
In-Reply-To: <20170528135611.10218-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sun, 28 May 2017 15:56:11 +0200")
References: <20170528135611.10218-1-bernd.kuhls@t-online.de>
Message-ID: <87poenkcts.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Fixes buffer overflow:
 > https://mail.coreboot.org/pipermail/flashrom/2016-March/014523.html

 > Removed patch 0002-sys-io.h.patch, not needed anymore, hwaccess.h now
 > contains a similar fix:

 >   elif defined(__linux__) || defined(__GLIBC__)

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
