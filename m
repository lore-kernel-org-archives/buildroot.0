From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 18 Aug 2020 17:28:49 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xlib_libX11: security
 bump version to 1.6.10
In-Reply-To: <20200802073413.201022-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sun, 2 Aug 2020 09:34:13 +0200")
References: <20200802073413.201022-1-bernd.kuhls@t-online.de>
Message-ID: <875z9g0y8e.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Fixes CVE-2020-14344:
 > https://lists.x.org/archives/xorg-announce/2020-July/003050.html

 > Removed md5 & sha1 hashes, upstream does not provide them anymore.

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
