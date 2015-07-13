From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Jul 2015 01:33:12 +0200
Subject: [Buildroot] NFS Server on Buildroot Target
In-Reply-To: <CAJJ6jxuV-JAUr+xtHtAkQ49XnOZ7kLDzo98S6-3=yKwxj=BaoQ@mail.gmail.com>
References: <CAMQcK5+eTg508+qHvP+_J_uB5L8vXHCKORvU=PmDpBXcZJ4swg@mail.gmail.com>
 <CAJJ6jxuV-JAUr+xtHtAkQ49XnOZ7kLDzo98S6-3=yKwxj=BaoQ@mail.gmail.com>
Message-ID: <20150714013312.772e5bf6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Steve Calfee,

On Mon, 13 Jul 2015 16:21:48 -0700, Steve Calfee wrote:

> I finally got the nfs server working maybe 2 years ago. Search for a
> patch email (later withdrawn) titled:"Fix nfs server for a read only
> rootfs"
> 
> Long story short, nfs requires your rootfs to be mounted r/w or the
> temp paths must be fixed to be writable.

We finally took some time to fix that up and the latest Buildroot
master should work fine thanks to:

  http://git.buildroot.net/buildroot/commit/package/nfs-utils?id=aec5af98caf65b8ad08db4f372527a0503bb381c
  http://git.buildroot.net/buildroot/commit/package/nfs-utils?id=a23d336fbdba575321cfddadf7d671810559b056

Do not hesitate to test it and report back your results.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
