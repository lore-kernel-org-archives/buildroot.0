From: Tiju Jacob <jacob_tiju@yahoo.com>
Date: Thu, 17 Apr 2008 11:40:59 +0530 (IST)
Subject: [Buildroot] Mount_filesystem_s3c2440
Message-ID: <775817.91355.qm@web94110.mail.in2.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
> The /etc/init.d/rcS gets invoked from the /etc/inittab. You comment the
> line in /etc/init.d/rcS
> And uncomment anyone of the following depending upon the tty driver you
> are using. You will get the shell prompt.
> #         tty2::askfirst:/bin/sh
> #         tty3::askfirst:/bin/sh
> #         tty4::askfirst:/bin/sh
> 

The problem remains the same. Each time I hit the enter key, it goes back to the same line. 
Output is as follows:
NET: Registered protocol family 1
NET: Registered protocol family 17
registered taskstats version 1
Freeing init memory: 608K

Please press Enter to activate this console.

Please press Enter to activate this console.

Please press Enter to activate this console..

Please press Enter to activate this console.


What could be the problem?

Regards,
Tiju



      Check out the all-new face of Yahoo! India. Go to http://in.yahoo.com/
