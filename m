From: Guillaume Gardet <guillaume.gardet@free.fr>
Date: Sat, 10 Dec 2011 11:01:54 +0100
Subject: [Buildroot] Make problem on 64-bit linux with CS 2009q1
In-Reply-To: <87y5ull8z0.fsf@macbook.be.48ers.dk>
References: <4EE1CB14.9010802@free.fr> <20111209193729.0cc88e6e@skate>
 <87y5ull8z0.fsf@macbook.be.48ers.dk>
Message-ID: <4EE32E12.3000303@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Le 09/12/2011 22:40, Peter Korsgaard a ?crit :
>>>>>> "Thomas" == Thomas Petazzoni<thomas.petazzoni@free-electrons.com>  writes:
>   >>  What could be the problem and how to solve it?
>
>   Thomas>  Yeah, we had report of issues with openSUSE. I guess it's the multilib
>   Thomas>  implementation in openSUSE that confuses Buildroot somehow. I need to
>   Thomas>  get my hand on an openSUSE system to debug this.
>
> I just did a suse install in kvm, and haven't been able to reproduce the
> issue yet. The SUSE devs does seem to have a few peculiar choices, such
> as having . in the path and using /usr/lib64 for the native 64bit libs.

I am using openSUSE (not SUSE Enterprise). Which version are you using?
PATH should not contain . and mine (openSUSE 12.1) does not have it.

>
> I'll try the specific .config next.
>
