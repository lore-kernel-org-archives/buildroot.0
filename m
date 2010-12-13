From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 13 Dec 2010 17:10:38 +0100
Subject: [Buildroot] [PATCH v2] New package: fbgrab
In-Reply-To: <1291908509-18850-1-git-send-email-daniel.nystrom@timeterminal.se>
	("Daniel =?utf-8?Q?Nystr=C3=B6m=22's?= message of "Thu,
	9 Dec 2010 16:28:29 +0100")
References: <1291908509-18850-1-git-send-email-daniel.nystrom@timeterminal.se>
Message-ID: <871v5lk60x.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniel" == Daniel Nystr?m <daniel.nystrom@timeterminal.se> writes:

 Daniel> FBGrab is a framebuffer screenshot program, capturing the linux
 Daniel> frambuffer and converting it to a png-picture.

Thanks, committed with minor tweaks.

Notice that kconfig handles selects recursively, so you don't need to
explicitly select dependencies of libpng (zlib).

-- 
Bye, Peter Korsgaard
