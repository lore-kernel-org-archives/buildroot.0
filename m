From: Michael John <MJohn@midmark.com>
Date: Mon, 11 Jan 2021 15:55:35 +0000
Subject: [Buildroot] How to include initramfs in a build
In-Reply-To: <DM6PR08MB4425D1744991DBE61A858B49AEAB0@DM6PR08MB4425.namprd08.prod.outlook.com>
References: <DM6PR08MB4425D1744991DBE61A858B49AEAB0@DM6PR08MB4425.namprd08.prod.outlook.com>
Message-ID: <DM6PR08MB44256C0960A1312B31B73DDFAEAB0@DM6PR08MB4425.namprd08.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I've used buildroot to create an initramfs image. Using a second config I created a rootfs for my board. I'd like to take the initramfs image and include it in my rootfs build but I'm not seeing how this could be done. I see in the menu->Filesystem->initramfs option, but it appears this builds an initramfs from the rootfs (my second config). I believe I could hard code the path to my initramfs in the Kernel config, but is there any better way via buildroot?

Thanks,
Michael John


CONFIDENTIALITY NOTICE: This message, including any attachments, contains confidential information intended for a specific individual and purpose. If you are not the intended recipient, you should delete this message and any disclosure, copying, or distribution of this message, or the taking of any action based on it, by you is strictly prohibited.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210111/03c16940/attachment.html>
