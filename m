From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 21 Feb 2014 12:44:39 +0100
Subject: [Buildroot] [PATCH] gpsd: disallow NMEA2000 CAN driver on AVR32
In-Reply-To: <1392981186-16080-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Fri, 21 Feb 2014 12:13:06 +0100")
References: <1392981186-16080-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87sircvgew.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > AVR32 is using uClibc 0.9.31, which lacks some CAN related definitions
 > that prevent the gpsd nmea2000 driver from building.

 > The rest of gpsd, with all options and drivers enabled, builds fine on
 > AVR32.

 > Fixes:

 >   http://autobuild.buildroot.org/results/ee2/ee2ec848e893f08fa80caf99a67e68b73b6400e8/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
