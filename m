From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 9 Jul 2019 19:28:28 +0200
Subject: [Buildroot] [PATCH 2/2] board/sifive: Add the HiFive Unleased
In-Reply-To: <0c6c487b-0383-b25a-3aa1-3601c632185e@embecosm.com>
References: <20190708215353.9107-1-alistair.francis@wdc.com>
 <20190708215353.9107-3-alistair.francis@wdc.com>
 <0c6c487b-0383-b25a-3aa1-3601c632185e@embecosm.com>
Message-ID: <3697d868-e446-6cc8-2806-42b4a761c36b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 09/07/2019 17:53, Mark Corbin wrote:
> Note that you will still get a warning reported by fdisk when you
> examine the SD card. This is because the genimage.cfg file doesn't
> specify the SD card size (as people will naturally have different sized
> cards), so the secondary GPT header is placed after the rootfs rather
> than at the end of the disk where it is expected to be.
> 
> You will also see the following at boot time:
> 
> [??? 2.318722] GPT:Primary header thinks Alt. header is not at the end
> of the disk.
> [??? 2.325390] GPT:190496 != 122142719
> [??? 2.328843] GPT:Alternate GPT header not at the end of the disk.
> [??? 2.334824] GPT:190496 != 122142719
> [??? 2.338302] GPT: Use GNU Parted to correct GPT errors.
> [??? 2.343456]? mmcblk0: p1 p2

 It would be good to have this information in the readme.

 Regards,
 Arnout
