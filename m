From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 14 Mar 2017 00:26:21 +0100
Subject: [Buildroot] [PATCH 1/1] package/git: add optional support for
	gettext
In-Reply-To: <20170312124314.19848-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sun, 12 Mar 2017 13:43:14 +0100")
References: <20170312124314.19848-1-bernd.kuhls@t-online.de>
Message-ID: <878to8wyg2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > git links to libintl if available:
 > $ output/host/usr/bin/i586-buildroot-linux-uclibc-readelf -a output/target/usr/bin/git | grep NEEDED
 >  0x00000001 (NEEDED)                     Shared library: [libz.so.1]
 >  0x00000001 (NEEDED)                     Shared library: [libintl.so.8]
 >  0x00000001 (NEEDED)                     Shared library: [libc.so.0]

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
