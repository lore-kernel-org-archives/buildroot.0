From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Sun, 28 Jul 2013 12:22:42 +0200
Subject: [Buildroot] target mkfs.ubifs support
In-Reply-To: <20130728010555.GM7098@bender.unx.csupomona.edu>
References: <20130728010555.GM7098@bender.unx.csupomona.edu>
Message-ID: <CAAXf6LUDC-OxT1L5kK6_E_tqEEYGF+eX9ObU7veHcTK+zG5yrA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Paul,

On Sun, Jul 28, 2013 at 3:05 AM, Paul B. Henson <henson@acm.org> wrote:
> I was looking at trying out buildroot for an embedded project I'm
> working on. It doesn't look like buildroot currently supports building
> mkfs.ubifs for the target? I see that it can build it for the host to be
> used to create a ubi rootfs image, but I need to build it for the target
> and have it actually be in the rootfs.
>
> There's an option in package/mtd/Config.in for mkfs.jffs2, is there any
> reason other than nobody's needed it yet there isn't an analogous option
> for mkfs.ubifs? If not, would a patch adding the ability to compile
> mkfs.ubifs for the target and have it included in the rootfs image be
> welcome?

This is probably the only reason. Patches are certainly most welcome!

Best regards,
Thomas
