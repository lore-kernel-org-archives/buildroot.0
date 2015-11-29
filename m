From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 29 Nov 2015 21:39:23 +0100
Subject: [Buildroot] [PATCH 1/3] package/Makefile.in: remove
	HOSTCC_VERSION
In-Reply-To: <20151129185224.695095a2@free-electrons.com> (Thomas Petazzoni's
 message of "Sun, 29 Nov 2015 18:52:24 +0100")
References: <1448147919-5463-1-git-send-email-arnout@mind.be>
 <87fuzx676p.fsf@dell.be.48ers.dk> <56536E0C.1010205@mind.be>
 <20151129185224.695095a2@free-electrons.com>
Message-ID: <87wpt0o804.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

>> > Ehh, no. I guess a 4.x version would make more sense. Any idea what 'x'
 >> > should be? 3? 5? 7?
 >> 
 >> We'd need to check all the host packages (plus the packages that build a host
 >> tool as part of the target build, like uboot) to be sure of that. The
 >> autobuilders tell us that 4.7 at least is OK.

 > My autobuilder instance uses gcc 4.4:

 > test at build:~$ gcc -v
 > [...]
 > gcc version 4.4.5 (Debian 4.4.5-8)

 > (Yes, I'm running old stuff. On purpose.)

Ok, good. RHEL6 afaik also uses GCC 4.4. In lack of a better option I
suggest we start requiring >= 4.4.

-- 
Venlig hilsen,
Peter Korsgaard 
