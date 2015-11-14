From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Nov 2015 23:25:00 +0100
Subject: [Buildroot] [PATCH/next 11/13] package/uclibc: Enable O_CLOEXEC
	in fopen()
In-Reply-To: <1447457203-27816-11-git-send-email-bernd.kuhls@t-online.de>
 (Bernd Kuhls's message of "Sat, 14 Nov 2015 00:26:41 +0100")
References: <1447457203-27816-1-git-send-email-bernd.kuhls@t-online.de>
 <1447457203-27816-11-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <87ziyggqwz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Needed for package/x11r7/xdriver_xf86-video-ati version bump.
 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

And what about external toolchains? What is the alternative? Makinng the
ati driver glibc/musl only? Perhaps that would be a better solution/

-- 
Bye, Peter Korsgaard
