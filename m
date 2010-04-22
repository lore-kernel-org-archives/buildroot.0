From: Michael Papet <mpapet@yahoo.com>
Date: Thu, 22 Apr 2010 10:25:36 -0700 (PDT)
Subject: [Buildroot] Build with Yaboot Issues
Message-ID: <282410.19114.qm@web62007.mail.re1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm a newbie that built an image for an old ibook G3 PPC. I'm using the pearpc emulator until I can get the image onto the iBook.   But I've stumbled on how to get the image to boot because it looks like pearPC (and the iBook) needs yaboot to get the boot process started.

While the option to include yaboot is still available in 'make menuconfig' it is breaks the build process. It appears as though the project dropped support recently anyway.  Das-u-boot might work, but it's not clear if it does for PPC.

The iBook has one Linux OS installed with a working yaboot.  I've got an empty partition waiting for the disk image.

What is the recommended workaround?  Even if the answer is obvious to others, any direction is welcome.

Thanks,
mpapet


      
