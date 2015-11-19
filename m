From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Nov 2015 23:10:18 +0100
Subject: [Buildroot] [PATCH 1/2] configs/qemu: cleanup and capitalization
In-Reply-To: <1447893511-14876-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 18 Nov 2015 21:38:30 -0300")
References: <1447893511-14876-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87r3jl7i9h.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Capitalize comments in a consistent way.
 > Cleanup redundant entries.
 > Drop global patch dir for sparc ss10 since it's not required any more.

These are not strictly bugfixes, but they seem quite safe and having
them on master will make it easier to merge next - So committed both,
thanks!

-- 
Bye, Peter Korsgaard
