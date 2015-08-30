From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 30 Aug 2015 23:50:27 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xdriver_xf86-video-ati:
	Fix DRI-related build
In-Reply-To: <1440931793-2679-1-git-send-email-bernd.kuhls@t-online.de> (Bernd
 Kuhls's message of "Sun, 30 Aug 2015 12:49:53 +0200")
References: <1440931793-2679-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <871tektpi4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > This package is not available on arm:
 > https://packages.gentoo.org/package/x11-drivers/xf86-video-ati

It is probably not only arm. Is there any realistic use cases for
anything besides x86 / x86-64?

-- 
Bye, Peter Korsgaard
