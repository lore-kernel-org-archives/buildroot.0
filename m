From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Oct 2016 07:53:13 +0200
Subject: [Buildroot] minimal config for new xorg ddx driver testing
In-Reply-To: <trinity-1074a4b4-83fd-4178-8f51-e9f3af810bd7-1476273824865@3capp-mailcom-bs01>
 (daggs@gmx.com's message of "Wed, 12 Oct 2016 14:03:44 +0200")
References: <trinity-1074a4b4-83fd-4178-8f51-e9f3af810bd7-1476273824865@3capp-mailcom-bs01>
Message-ID: <87shs0n6ba.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "daggs" == daggs  <daggs@gmx.com> writes:

 > Greetings,
 > I'm trying to test a new xorg ddx driver, problem is that I'm unable
 > to start X properly. I never start by itself and I seem to always miss
 > some cli params.
 > is there any place were can I find a minimal config I can use that surely start an X based DE or something?

You can take a look at minnowboard_max-graphical_defconfig, as that one
boots up into a X11 environment.

-- 
Bye, Peter Korsgaard
