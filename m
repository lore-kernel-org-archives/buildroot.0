From: Koenraad lelong <buildroot@de-brouwerij.be>
Date: Mon, 15 Jan 2007 22:05:51 +0100
Subject: [Buildroot] TinyX or fb question
Message-ID: <45ABECAF.6090200@de-brouwerij.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
My apologies if this is not the right list.
I'm trying to get X running and I'm succeeding partly. When I "modprobe 
savagefb" it reports a resolution of 800x600. My LCD has only 640x480. I 
tried "Xfbdev -screen 640x480" but this doesn't work, the screen 
resolution remains 800x600 I think : the X-cursor is not in the middle 
of the screen so I guess it's 800x600.
How can I tell the screen it's only 640x480 ?
Does tinyX have a configuration file ? I tried with /etc/X11/XF86Config, 
from the original installation (2.4 kernel).
I'm building with buildroot rev 17172.
Any suggestions are welcome. If it's RTFM, please give some hints were I 
could find it, because I find x.org not really helpfull.
Regards,
Koenraad Lelong.
