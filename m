From: Weber, Matthew L                            Collins <Matthew.Weber@collins.com>
Date: Thu, 20 May 2021 16:53:53 +0000
Subject: [Buildroot] package/mrouted: add sysv init script (question about
 path to mrouted executable)
Message-ID: <DM2P110MB0105DD26E1BE67B17781DC69F22A9@DM2P110MB0105.NAMP110.PROD.OUTLOOK.COM>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Joachim,

I noticed when bumping to 2021LTS that the mrouted provided initv script has /sbin/mrouted as the executable path.  I see an error on boot because, in a non-collapsed folder structure, the executable is in /usr/sbin/.  

  Starting mrouted: start-stop-daemon: can't execute '/sbin/mrouted': No such file or directory
  FAIL

Any issues you can see with making that change to the script should be transparent to collapsed vs. not?

Regards,
Matt
