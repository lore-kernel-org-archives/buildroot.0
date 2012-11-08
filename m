From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 08 Nov 2012 08:44:13 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2012-11-07
In-Reply-To: <20121108073352.3038352C090@lolut.humanoidz.org> (Thomas
 Petazzoni's message of "Thu, 8 Nov 2012 08:33:51 +0100 (CET)")
References: <20121108073352.3038352C090@lolut.humanoidz.org>
Message-ID: <87r4o4a69e.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Hello,

 Thomas> On 2012-11-07, 252 random build tests have been done and
 Thomas> submitted on autobuild.buildroot.net.
 Thomas>  35 builds have been successful
 Thomas>  217 builds have failed

Which is crap :/

2012.11-rc1 is already late, so we'll have to do something pretty
soon. The biggest issues are afaik the perl and tirpc stuff, so I think
the best way forward is to:

- mark perl as broken for now
- revert auto* back to use microperl
- disallow tirpc when toolchain has rpc

I'll try to find time to do that this week.

-- 
Bye, Peter Korsgaard
