From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Dec 2013 12:19:39 +0100
Subject: [Buildroot] [PATCH 0/9] iso9660/grub improvements
In-Reply-To: <1388242600-2580-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1388242600-2580-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20131229121939.46f10296@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 28 Dec 2013 15:56:31 +0100, Thomas Petazzoni wrote:

> Here is a set of commits that improves the iso9660/grub handling:
> 
>  * Ensures that grub is built with the iso9660 support when the
>    iso9660 image format has been selected.
> 
>  * Add splashscreen support to Grub for the iso9660 image mechanism.
> 
>  * Do not include the initrd into the filesystem if it is built into
>    the kernel image itself.
> 
>  * Related improvements/fixes

I have applied patches 1, 2, 3, 4 and 7. For patches 5, 6, 8 and 9, I'm
waiting for Yann's Acked-by, or someone else Acked-by :)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
