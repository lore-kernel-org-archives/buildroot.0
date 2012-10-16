From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 16 Oct 2012 23:17:53 +0200
Subject: [Buildroot] [PATCH] gpsd: fix nmea2000 build failure
In-Reply-To: <1350390799-9171-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 16 Oct 2012 09:33:19 -0300")
References: <1350390799-9171-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87k3uqru9q.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> NMEA2000 seems to require NAVCOM for some odd reason.
 Gustavo> Fixes
 Gustavo> http://autobuild.buildroot.net/results/91ddc286f6a92498f96aba7d312f82d5c77a689a/build-end.log
 Gustavo> Also do a correct sort of protocol config options.

Committed, thanks.

-- 
Bye, Peter Korsgaard
