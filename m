From: Will Wagner <will_wagner@carallon.com>
Date: Thu, 20 Mar 2008 19:07:55 +0000
Subject: [Buildroot] zImage corruption
Message-ID: <47E2B60B.70106@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

I have been happily using buildroot for a while (thanks all its a great 
tool).

However I have started seeing a problem where the linux zImage being 
built gets corrupted and does not boot.

I am building a custom arm device using initramfs. If I checkout from 
clean and build it all works great and get a working zImage that is 
~7.5MB. However if I then run make again I get a zImage file that is 
~6.5MB and does not boot.

I have compared the root filesystems before and after calling make again 
and can see no difference. I have also tried doing a dirclean on the 
kernel and rebuilding and this still leads to a corrupt zImage.

Has anyone seen this before? Can anyone suggest what could be going on?

I can supply more config info if needed.

Thanks,
Will
-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Senior Project Engineer                  Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
