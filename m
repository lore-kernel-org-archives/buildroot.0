From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 05 Nov 2017 21:34:53 +0100
Subject: [Buildroot] [PATCH 1/4] kvm-unit-test: x86-64 variant only
 available on x86-64 hosts
In-Reply-To: <54eed396-cdc0-759d-81b8-cdb387e792a2@mind.be> (Arnout
 Vandecappelle's message of "Sun, 5 Nov 2017 21:23:43 +0100")
References: <20171102104520.29257-1-peter@korsgaard.com>
 <20171102104520.29257-2-peter@korsgaard.com>
 <687901ac-c7d7-81bb-944b-b2c860f90bae@mind.be>
 <87k1z41q6t.fsf@dell.be.48ers.dk>
 <54eed396-cdc0-759d-81b8-cdb387e792a2@mind.be>
Message-ID: <87d14wzcpe.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> But some parts of kvm-unit-tests presumably are 64bit when building for
 >> x86-64, 

 >  OK, I assumed everything was built with -m32. If some parts are indeed still
 > 64-bit then it won't work in i386 host.

Exactly.

 >> which wouldn't work when using the host compiler on a x86
 >> system, right? I don't think x86 system compilers are 32/64bit multilib

 >  Actually, on Debian i386 it is possible to install 64-bit multilib I think. But
 > obviously we can't count on that.

 >  BTW, what happens on x32, does anybody know that?

Is x32 really used by any mainstream distro? I would guess it is as rare
as building on a !x86 machine.


 >> But I haven't actually used a x86 distribution in the last 10 years or
 >> so, so perhaps I'm missing something?

 >  Yeah, it's pretty unlikely as well I guess.

 >  I'll apply this patch as well then.

Great, thanks!

-- 
Bye, Peter Korsgaard
