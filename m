From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Feb 2018 07:33:48 +0100
Subject: [Buildroot] [PATCH 1/1] azmq: bump to version 1.0.2
In-Reply-To: <MWHPR0601MB37534B75BE813D41A6C3920ED3C70@MWHPR0601MB3753.namprd06.prod.outlook.com>
 (Trent Piepho's message of "Wed, 28 Feb 2018 06:11:17 +0000")
References: <20180227205125.8121-1-fontaine.fabrice@gmail.com>
 <87lgfem9h0.fsf@dell.be.48ers.dk>
 <MWHPR0601MB37534B75BE813D41A6C3920ED3C70@MWHPR0601MB3753.namprd06.prod.outlook.com>
Message-ID: <87vaehlj1v.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Trent" == Trent Piepho <tpiepho@impinj.com> writes:

 >> >>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:
 >> Does this fix any big / security issues so it needs to go to master or
 >> s this for next?

 > The previous version of azmq will not build with the boost version in 2018.02-rc2.

 > It does work with buildroot 2017.11.2.

 > Not sure exactly where the breakage point was between those releases.

Ahh, so azmq-1.0 doesn't build in 2018.02-rc3? Odd, I don't see it in
the autobuilders.

-- 
Bye, Peter Korsgaard
