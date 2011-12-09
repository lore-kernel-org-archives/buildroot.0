From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 09 Dec 2011 23:45:58 +0100
Subject: [Buildroot] Make problem on 64-bit linux with CS 2009q1
In-Reply-To: <87y5ull8z0.fsf@macbook.be.48ers.dk> (Peter Korsgaard's message
 of "Fri, 09 Dec 2011 22:40:35 +0100")
References: <4EE1CB14.9010802@free.fr> <20111209193729.0cc88e6e@skate>
 <87y5ull8z0.fsf@macbook.be.48ers.dk>
Message-ID: <87ty59l5y1.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <jacmet@uclibc.org> writes:

 Peter> I just did a suse install in kvm, and haven't been able to reproduce the
 Peter> issue yet. The SUSE devs does seem to have a few peculiar choices, such
 Peter> as having . in the path and using /usr/lib64 for the native 64bit libs.

 Peter> I'll try the specific .config next.

Which just finished building here without any problems and no
usr/lib64. Any ideas?

-- 
Bye, Peter Korsgaard
