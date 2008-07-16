From: Joseph G. Boike <joe.boike@acsatlanta.com>
Date: Tue, 15 Jul 2008 22:36:44 -0500
Subject: [Buildroot] buildroot size ballooned
Message-ID: <487D6CCC.7060109@acsatlanta.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, my buildroot filesize had been around 3-4M (w/ r 22508)
With r 225765 and building using at91sam9260dfc_defconfig the filesize 
has jumped to ~14M.
Any thoughts on why?
(I have kernel 2.6.26 now.  The kernel size has been fairly consistent 
around 1.5M.)
Regards,
Joe
