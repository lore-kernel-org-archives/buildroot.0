From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 19 Jul 2011 12:21:17 +0200
Subject: [Buildroot] [PATCHv4] udev: bump to 172
In-Reply-To: <4E25586E.1030509@visionsystems.de> (Yegor Yefremov's message of
 "Tue, 19 Jul 2011 12:11:58 +0200")
References: <4E25586E.1030509@visionsystems.de>
Message-ID: <87ei1m4llu.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yegor" == Yegor Yefremov <yegor_sub1@visionsystems.de> writes:

 Yegor> Signed-off-by: Heiko Zuerker <smiley73@users.sourceforge.net>
 Yegor> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Thanks - It would be good if you in the future could list (after the ---
line so it doesn't become part of the commit message) what you have
changed since the previous version.

From a quick look, I think the only pending issue is about the
UDEV_VOLUME_ID dependencies of usbmount/hal. What do we do about those?
I don't know much about udev/hal/usbmount, but presumably there's a way
forward here?

-- 
Bye, Peter Korsgaard
