From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 06 Apr 2012 13:45:11 -0300
Subject: [Buildroot] [PATCH 1/2] qemu/x86: Adapted qemu command line in
 readme file
In-Reply-To: <1333729180-18218-1-git-send-email-sho@relinux.de>
References: <1333729180-18218-1-git-send-email-sho@relinux.de>
Message-ID: <52c7e9684ce54565c417f75a9b912be3@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-04-06 13:19, Stephan Hoffmann wrote:


> -  qemu-system-i386 -M pc -kernel output/images/bzImage -drive
> file=output/images/rootfs.ext2,if=ide -append root=/dev/sda
> +  qemu-system-i386 -M pc -kernel images/bzImage -drive
> file=images/rootfs.ext2,if=ide -append root=/dev/sda

Why?
I don't think it's common for users to be in the output directory as 
their current working directory.
Regards.
