From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Jan 2019 21:09:14 +0100
Subject: [Buildroot] [PATCH 1/1] syslog-ng: fix build on m68k with uclibc
In-Reply-To: <20190113102332.9810-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 13 Jan 2019 11:23:32 +0100")
References: <20190113102332.9810-1-fontaine.fabrice@gmail.com>
Message-ID: <87won5r8d1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > uclibc on m68k defines pthread_spinlock_t but does not define
 > pthread_spin_trylock so check for this function before using it

 > Fixes:
 >  - http://autobuild.buildroot.org/results/0a6de11c030a4f39e402917809fc6d33fb463d1b

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
