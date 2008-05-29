From: Robin Gilks <robin.gilks@tait.co.nz>
Date: Fri, 30 May 2008 09:27:35 +1200
Subject: [Buildroot] Atmel AVR32 buildroot branch
Message-ID: <483F1FC7.5030600@tait.co.nz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Where do I raise issues with the Atmel AVR32 branch of buildroot? I 
can't find a relevant mailing list/forum...

If what I'm seeing is common to the main trunk perhaps someone could 
assist here...

u-boot builds all the tools with the cross compiler - not very useful 
where mkimage is concerned. I eventually sorted it out manually but the 
u-boot makefile assumes all sorts of things being set in the 
environment/passed to it that it was a major PITA - it also of course 
interrupts the flow so that the kernel build fails as it doesn't get 
built with a u-image wrapper.

-- 
Robin Gilks
Senior Design Engineer          Phone: (+64)(3) 357 1569
Tait Electronics                Fax  :  (+64)(3) 359 4632
PO Box 1645 Christchurch        Email : robin.gilks at tait.co.nz
New Zealand

=======================================================================
This email, including any attachments, is only for the intended
addressee.  It is subject to copyright, is confidential and may be
the subject of legal or other privilege, none of which is waived or
lost by reason of this transmission.
If the receiver is not the intended addressee, please accept our
apologies, notify us by return, delete all copies and perform no
other act on the email.
Unfortunately, we cannot warrant that the email has not been
 altered or corrupted during transmission.
=======================================================================
