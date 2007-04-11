From: Robin Gilks <robin.gilks@tait.co.nz>
Date: Wed, 11 Apr 2007 14:01:26 +1200
Subject: [Buildroot] module-init-tools always compiled...
Message-ID: <461C4176.60808@tait.co.nz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

...and it fails because it does not support my target avr32.

It is NOT selected as a package but there seems to be some dependancy 
from linux26 via depmod to module-init-tools. I don't want the module 
tools (especially since I can't compile them!!) but of course a top 
level make always fails due to this dependency.

Any clues on how I get round it? I'm not very good with make files :-(

Cheers

-- 
Robin

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
