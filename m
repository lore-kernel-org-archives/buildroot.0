From: Paul B. Henson <henson@acm.org>
Date: Sat, 27 Jul 2013 18:05:55 -0700
Subject: [Buildroot] target mkfs.ubifs support
Message-ID: <20130728010555.GM7098@bender.unx.csupomona.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I was looking at trying out buildroot for an embedded project I'm
working on. It doesn't look like buildroot currently supports building
mkfs.ubifs for the target? I see that it can build it for the host to be
used to create a ubi rootfs image, but I need to build it for the target
and have it actually be in the rootfs.

There's an option in package/mtd/Config.in for mkfs.jffs2, is there any
reason other than nobody's needed it yet there isn't an analogous option
for mkfs.ubifs? If not, would a patch adding the ability to compile
mkfs.ubifs for the target and have it included in the rootfs image be
welcome?

Thanks...
