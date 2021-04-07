From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 07 Apr 2021 11:07:51 +0200
Subject: [Buildroot] [PATCH/2021.2 v1] package/genimage: fix for WSL
 (Windows-Subsystem for Linux)
In-Reply-To: <20210310191651.20769-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Wed, 10 Mar 2021 20:16:51 +0100")
References: <20210310191651.20769-1-ps.report@gmx.net>
Message-ID: <87tuoicviw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > - add upstream patch ([1]) to fix usage with WSL (Windows-Subsystem for Linux)
 > Fixes:

 >   - https://bugs.busybox.net/show_bug.cgi?id=13146
 >   - https://bugs.busybox.net/show_bug.cgi?id=13601

 >   ERROR: hdimage(sdcard.img): fiemap .../images/boot.vfat: 25 Inappropriate ioctl for device
 >   ERROR: hdimage(sdcard.img): failed to write image partition 'boot'

 > [1] https://github.com/pengutronix/genimage/commit/4c2b02df0861e06ca9320d80ad60994d4a239ad6.patch

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
