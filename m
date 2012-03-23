From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 23 Mar 2012 10:04:48 +0100
Subject: [Buildroot] [PATCH 1/5] Add the systemd package
In-Reply-To: <4F6C3993.2080306@free-electrons.com> (Maxime Ripard's message of
 "Fri, 23 Mar 2012 09:51:31 +0100")
References: <cover.1332408273.git.maxime.ripard@free-electrons.com>
 <cover.1332408273.git.maxime.ripard@free-electrons.com>
 <13349984bf3bf708b18546d37b0761a4890c7bbf.1332408273.git.maxime.ripard@free-electrons.com>
 <87vclw1ibd.fsf@macbook.be.48ers.dk>
 <4F6C3993.2080306@free-electrons.com>
Message-ID: <87bonnadsf.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Ripard <maxime.ripard@free-electrons.com> writes:

Hi,
 >> As you changed the depend on, this should also say something like:
 >> 
 >> (depends on /dev management with udev)
 >> 
 >> and depend on !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV

 Maxime> Of course.
 Maxime> I forgot LARGEFILE and WCHAR as well..

That's not needed as BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV already
depends on those.

-- 
Bye, Peter Korsgaard
