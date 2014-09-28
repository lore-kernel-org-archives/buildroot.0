From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 28 Sep 2014 21:22:27 +0200
Subject: [Buildroot] [PATCH v4 1/1] rpi-userland: Fix vcfiled startup
In-Reply-To: <1407425068-7820-1-git-send-email-benoit.thebaudeau@advansee.com>
 (=?utf-8?Q?=22Beno=C3=AEt_Th=C3=A9baudeau=22's?= message of "Thu, 7 Aug
 2014 17:24:28 +0200")
References: <1407425068-7820-1-git-send-email-benoit.thebaudeau@advansee.com>
Message-ID: <87sijbv9cc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Beno?t" == Beno?t Th?baudeau <benoit.thebaudeau@advansee.com> writes:

 > The VideoCore file server daemon startup script installed from this package is
 > not compatible with BuildRoot (because of its naming and other Debian
 > dependencies), which prevented vcfiled from starting. Hence, prevent this
 > package from installing its vcfiled startup script, and add a configuration
 > option to install a vcfiled SysV init script suitable for BuildRoot.

 > Signed-off-by: Beno?t Th?baudeau <benoit.thebaudeau@advansee.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
