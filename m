From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 19 Jul 2011 12:50:58 +0200
Subject: [Buildroot] [PATCHv4] udev: bump to 172
In-Reply-To: <4E2560AA.20603@visionsystems.de> (Yegor Yefremov's message of
 "Tue, 19 Jul 2011 12:47:06 +0200")
References: <4E25586E.1030509@visionsystems.de>
 <87ei1m4llu.fsf@macbook.be.48ers.dk> <4E2560AA.20603@visionsystems.de>
Message-ID: <8762my4k8d.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yegor" == Yegor Yefremov <yegor_sub1@visionsystems.de> writes:

Hi,

 >> >From a quick look, I think the only pending issue is about the
 >> UDEV_VOLUME_ID dependencies of usbmount/hal. What do we do about those?
 >> I don't know much about udev/hal/usbmount, but presumably there's a way
 >> forward here?

 Yegor> It seems to become a lot of work :-)

Yes, I know - Sorry about that. On the other hand, I cannot break the
build for the existing users of hal/usbmount.

Thanks for the links, will take a look.

-- 
Bye, Peter Korsgaard
