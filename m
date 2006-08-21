From: don <don_reid@comcast.net>
Date: Sun, 20 Aug 2006 20:47:34 -0700
Subject: [Buildroot] Bootloader (grub?)
Message-ID: <20060821034734.GA14534@reid1.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Which bootloader do you-all recommend for an x86 (Via EPIA) system booting
from a compact flash card?

I have been trying to set up grub, just because that is the one I am used to.
First I found it wouldn't build (due to a makefile problem reported in Jan.).
Then I found the patch file called for is no longer on the source server.
These make me think it isn't getting much use.

When I finally got it all compiles, I couldn't find any trace of it in the
target file system.  I guess it could be nicely put into the MBR for me.
But shouldn't there still be some files (/boot/grub/*)?

Do I just need to create the menu file manually?

Don Reid
