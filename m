From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Jan 2020 17:48:31 +0100
Subject: [Buildroot] [PATCH v4 2/3] package/rpi-firmware: bump version
 to 01ecfd2
In-Reply-To: <20200124115738.16642-2-ps.report@gmx.net> (Peter Seiderer's
 message of "Fri, 24 Jan 2020 12:57:37 +0100")
References: <20200124115738.16642-1-ps.report@gmx.net>
 <20200124115738.16642-2-ps.report@gmx.net>
Message-ID: <87a768sv4w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Keep rpi-firmware up-to-date with the kernel
 > vesion bump (4.19.97).

 > Go back to sha1 version scheme instead of official tag (after
 > only two tag versions) to keep up with the up-to-date kernel
 > version (as the offical last tag is for 4.19.94).

 > Update boot/LICENCE.broadcom hash according to the
 > 'Update to support customisation program ' change ([1]).

 > [1] https://github.com/raspberrypi/firmware/commit/dd9e9ebb5d5306e91acb135db890cf18f3a5eea2#diff-b7cccbd9821a372750de822dfd97a843

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 > ---
 > Changes v1 -> v2:
 >   - no changes

 > Changes v2 -> v3:
 >   - bump version to be2713b/4.19.95
 >   - add sha1 explanation
 >   - update boot/LICENCE.broadcom hash

 > Changes v3 -> v4:
 >   - bump version to 01ecfd2/4.19.97
 >   - update change tag/sha1 reasoning

Committed, thanks.

-- 
Bye, Peter Korsgaard
