From: William Somerset <williamsomerset@gmail.com>
Date: Wed, 21 Mar 2007 17:09:35 -0500
Subject: [Buildroot] Problems loading buildroot image to CompactFlash
Message-ID: <16732d180703211509g47d56803q56f64dce7f02329b@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I'm having problems getting a BuildRoot Image to boot on a compactflash.  I
got grub installed on the disk but whenever I try to boot the CompactFlash,
I just get a blank screen.  I tried just dd'ing the image to the
compactflash but I get 'missing OS' whenever I boot the compactflash that
way.

Also, I tried installing the Linux Kernel from the menu and it had problems
installing.  This is from getting the copy of buildroot from svn at around
2pm CST today (March 21, 2007).  I loaded the grub prompt, changed the root
to the compact flash and got grub to install to the compactflash but I guess
without a kernel, it's kinda pointless.  Should I just make 1 partition or 2
(one for boot, one for main)?  Also, when I tried making an ISO, I got
errors from it not having some place to copy to.

Does anyone have a walkthrough or anything to help me out getting a
buildroot image to compactflash?
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070321/2b8a68c6/attachment.htm 
