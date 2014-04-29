From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 29 Apr 2014 14:08:47 -0300
Subject: [Buildroot] [PATCH] btrfs-progs: new package
In-Reply-To: <20140429165618.GB3248@free.fr>
References: <1398790166-18900-1-git-send-email-gustavo@zacarias.com.ar>
 <20140429165618.GB3248@free.fr>
Message-ID: <535FDC9F.70805@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/29/2014 01:56 PM, Yann E. MORIN wrote:

> This should also "depends on BR2_USE_MMU".

Ooops, i'll add it up.

> Would it make sense to add them as host-tools, too?

Not really IMHO.
Grub2 can in theory understand btrfs, but that would be realistically
speaking a x86/amd64-only thing.
And then btrfs-progs AFAIK doesn't include any tool to create images
like genext2fs does, it talks directly with block devices.
Sudo with loopback is a bit dangerous and off the charts i think.
Regards.
