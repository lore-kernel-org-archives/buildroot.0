From: =?UTF-8?B?QmVub8OudA==?= Allard <benoit.allard@greenbone.net>
Date: Fri, 9 Jun 2017 11:50:09 +0200
Subject: [Buildroot] [git commit] package/gnu-efi: bump version to 3.0.5
In-Reply-To: <20170608142819.4d3fc959@armant.office.greenbone.net>
References: <20170608142819.4d3fc959@armant.office.greenbone.net>
Message-ID: <20170609115009.5392d721@armant.office.greenbone.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 8 Jun 2017 14:28:19 +0200
Beno?t Allard <benoit.allard@greenbone.net> wrote:

> [
> Not a genuine reply, my mailbox had a downtime when the original mail
> was sent.
> 
> Refering to commit: 
> https://git.buildroot.net/buildroot/commit/?id=d0402a6e72c8ca5088d860bb788084147a049968
> ]
> 
> Hi together,
> 
> It seems the version bump of gnu-efi (3.0.1 -> 3.0.5) is breaking at
> least syslinux.
> 
> Our autobuilders don't exercise the bootloaders, so we missed it.
> 
> I've quickly tried to see how deep the differences are, first had
> issues with conflicting function prototypes, then with structs which
> changed name, and finally with conflicting definition of longjump
> types. I gave up for now while investigating that last one.

I've got three patches that allow me to build syslinux with the newer
version I'll post later today.

> 
> syslinux ships with an included own version of gnu-efi, so they might
> not be interested in fixing that immediately (I've not raised the
> issue over there yet).

Because they ship with an integrated version of gnu-efi (from around
Feb. 2014), there isn't much traction in integrating new patches there.
I'll post my patches to their list as well anyway.

Regards,
Ben.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 473 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170609/b3c213cd/attachment.asc>
