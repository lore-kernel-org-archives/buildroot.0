From: Steven J. Hill <sjhill@realitydiluted.com>
Date: Thu, 21 Jun 2007 11:32:36 -0500
Subject: [Buildroot] Toolchain installation location changed
In-Reply-To: <d824fc380706210838u5e2b3a91jfa2d0a4bd701d7ca@mail.gmail.com>
References: <d824fc380706210838u5e2b3a91jfa2d0a4bd701d7ca@mail.gmail.com>
Message-ID: <20070621163236.GA22556@real.realitydiluted.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> I compiled 6/20/2007's snapshot and found the cross toolchain for
> ARM-(little endian) is at build_arm/staging_dir/bin(consistent with
> the document). Then I did a svn checkout same day at night, and tried
> a 6/21/2007's snapshot, the location for the cross toolchain moved to
> build_arm/staging_dir/usr/bin. New to this list, wondering why this
> has changed all of a sudden.
>
The changes were checked in to allow the toolchain built by buildroot
to be relocatable such that you could move it from buildroot into a
directory of your choosing. I feel your pain, I cannot even build a
toolchain right now due to all the new changes.

-Steve
