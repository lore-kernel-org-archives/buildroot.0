From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Jul 2012 21:37:29 +0200
Subject: [Buildroot] Package informations, online and updated
Message-ID: <20120731213729.49c4b3ee@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

After the update to the pkg-stats package, I've set up the necessary
infrastructure to keep an updated online result of this script. It can
be seen at any time at:

 http://autobuild.buildroot.org/stats/

I will run the script every day in a crontab, after doing a git pull,
so it will reflect the daily status of our packages.

There are probably more metrics to add, even small things like presence
of ':=' operators. Don't hesitate to share your ideas and patches about
this.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
