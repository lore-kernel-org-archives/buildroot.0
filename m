From: Bogdan Cristea <cristeab@gmail.com>
Date: Thu, 12 Nov 2009 17:03:07 +0200
Subject: [Buildroot] Creating a filesystem for QEMU
In-Reply-To: <4d28d4b50911120658h67155758k54a7d95599cee1fe@mail.gmail.com>
References: <200911121623.45929.cristeab@gmail.com>
	<4d28d4b50911120658h67155758k54a7d95599cee1fe@mail.gmail.com>
Message-ID: <200911121703.07478.cristeab@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday 12 November 2009 16:58:15 you wrote:
>   - You can generate a cloop root filesystem using buildroot, and then
>    convert it to the format you want using qemu-img
>    - Create an initramfs, and boot it using qemu
>    - Create an ext2 filesystem and write it on a qemu disk through an
>    install cdrom
>    - and so on....
> 
   Thank you for your feedback, I'll try to explore these options in the next 
days. IMHO it could be extremely useful to have these indications into the 
help page of buildroot.
   Could you expand a little more the last option (Create an ext2 filesystem 
and write it on a qemu disk through an install cdrom). I don't understand that 
part.

thanks
Bogdan
