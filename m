From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 04 Aug 2011 21:16:48 +0200
Subject: [Buildroot] [PATCH 1/2] orc: new package
In-Reply-To: <1312100368.687.4.camel@bender> (Sven Neumann's message of "Sun, 
 31 Jul 2011 10:19:27 +0200")
References: <1310628760-4172-1-git-send-email-s.neumann@raumfeld.com>
 <1310628760-4172-2-git-send-email-s.neumann@raumfeld.com>
 <87k4b7uzey.fsf@macbook.be.48ers.dk> <1312100368.687.4.camel@bender>
Message-ID: <87wretng0v.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

Hi,

 >> Should usr/bin/orcc get removed if !BR2_HAVE_DEVFILES or is it needed
 >> for anything?

 Sven> Yes, that makes sense. There's also /usr/bin/orc-bugreport which should
 Sven> probably be removed as well.

 >> I've committed with those changes (except for orcc, please advice) -
 >> Thanks.

 Sven> I won't find time to do the proposed changes before next week as I am
 Sven> currently on vacation.

No problem, I've fixed it now.

-- 
Bye, Peter Korsgaard
