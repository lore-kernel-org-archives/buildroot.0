From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 12 May 2014 23:30:42 +0200
Subject: [Buildroot] [PATCH v6 03/32] mesa3d: use --enable-shared-glapi
	also for Gallium drivers
In-Reply-To: <1399716164-6452-4-git-send-email-bernd.kuhls@t-online.de> (Bernd
 Kuhls's message of "Sat, 10 May 2014 12:02:15 +0200")
References: <1399716164-6452-1-git-send-email-bernd.kuhls@t-online.de>
 <1399716164-6452-4-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <87ppjiwupp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Needed since this upstream commit:
 > http://cgit.freedesktop.org/mesa/mesa/commit/configure.ac?h=10.2&id=0432aa064bf5d4d0ad8fc3c4d648b8feb238ddfa

 > Remove --disable-shared-glapi from the non-DRI-block, this
 > would break with enabled Gallium drivers.

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
