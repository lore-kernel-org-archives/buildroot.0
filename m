From: Tiju Jacob <jacob_tiju@yahoo.com>
Date: Wed, 7 May 2008 11:03:00 +0530 (IST)
Subject: [Buildroot] link to busybox
Message-ID: <102389.57784.qm@web94112.mail.in2.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Christian,

> The respawn problem typically is not related to a specific shell, but 
> either to a misconfiguration of the /etc files (especially rc.S) or, 
> more probable, missing /dev/tty??
> You might want to check those messages.

What kind of tty? My serial device ttySAC0 is present in /dev.

> In my case, I had to add several special devices by hand, not added by 
> buildroot

What type of devices? I may also be missing these devices.

>(and I also replaced all the files in /etc with a single rc.S one, 
>which resolved several other problems). The 
>platform is an ARMv6 board.
 
I am very new to this. Could you please tell me how to modify these files to my requirement or atleast the links from where I will get more information regarding this?

Thanks in advance.
Tiju



      From Chandigarh to Chennai - find friends all over India. Go to http://in.promos.yahoo.com/groups/citygroups/
