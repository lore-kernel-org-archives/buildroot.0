From: Shawn Goff <shawnjgoff@gmail.com>
Date: Sat, 17 Nov 2012 08:17:44 -0500
Subject: [Buildroot] Built a file system,
 have a working kernel - how to login ?
In-Reply-To: <20121117130703.03beb6e1@skate>
References: <CAF-Ht3yZfCDAMpPGJ7NFd_RQ0brOwxw3pSSoA3YFtzVf7kpf2g@mail.gmail.com>
 <20121117111132.17a91542@skate>
 <CAF-Ht3xTA8gLLFS5j64LFSQ9_U5O7+42Uj0Yq4CMZWWZb3g3YA@mail.gmail.com>
 <20121117123531.431cbd65@skate>
 <CAF-Ht3zwxboYWZ6Q3ocMtFaAnQ9xEo+qfWfSsovdZuZa3sotkQ@mail.gmail.com>
 <20121117130703.03beb6e1@skate>
Message-ID: <CABYt4-ZRHdmbCAwtt8+swiwRHNwg=0_zEJxe7UnxetBgudXGKg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Please enable a tarball root filesystem image, and then extract is as
> root on the partition of your memory card.
>

Since you said you're not yet familiar with Buildroot, I'll clarify
that. Thomas is refering to the Buildroot option
BR2_TARGET_ROOTFS_TAR. The resulting file is in output/images.
