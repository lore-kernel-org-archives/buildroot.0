From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 03 Jul 2016 19:52:38 +0200
Subject: [Buildroot] [PATCH 3/3] package/transmission: add optional
	support for libminiupnpc/libnatpmp
In-Reply-To: <1467497893-16126-3-git-send-email-bernd.kuhls@t-online.de>
 (Bernd Kuhls's message of "Sun, 3 Jul 2016 00:18:13 +0200")
References: <1467497893-16126-1-git-send-email-bernd.kuhls@t-online.de>
 <1467497893-16126-3-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <87eg7apq1l.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Transmission bundles copies of both libraries and uses them if they are
 > not provided by the system. This patch allows transmission to use the
 > system libraries of libminiupnpc/libnatpmp.

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
