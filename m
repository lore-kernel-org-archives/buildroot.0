From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 09 Dec 2011 22:40:35 +0100
Subject: [Buildroot] Make problem on 64-bit linux with CS 2009q1
In-Reply-To: <20111209193729.0cc88e6e@skate> (Thomas Petazzoni's message of
 "Fri, 9 Dec 2011 19:37:29 +0100")
References: <4EE1CB14.9010802@free.fr> <20111209193729.0cc88e6e@skate>
Message-ID: <87y5ull8z0.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 >> What could be the problem and how to solve it?

 Thomas> Yeah, we had report of issues with openSUSE. I guess it's the multilib
 Thomas> implementation in openSUSE that confuses Buildroot somehow. I need to
 Thomas> get my hand on an openSUSE system to debug this.

I just did a suse install in kvm, and haven't been able to reproduce the
issue yet. The SUSE devs does seem to have a few peculiar choices, such
as having . in the path and using /usr/lib64 for the native 64bit libs.

I'll try the specific .config next.

-- 
Bye, Peter Korsgaard
