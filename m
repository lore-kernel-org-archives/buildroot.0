From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 27 Jun 2008 16:07:07 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
In-Reply-To: <20080627124653.GA31649@real.realitydiluted.com>
	(sjhill@realitydiluted.com's message of "Fri\,
	27 Jun 2008 07\:46\:53 -0500")
References: <20080626065112.3F4CB3C289@busybox.net>
	<877iccn0ml.fsf@macbook.be.48ers.dk> <18151015.post@talk.nabble.com>
	<87y74ri68u.fsf@macbook.be.48ers.dk> <20080627120011.GD32468@mx.loc>
	<20080627124653.GA31649@real.realitydiluted.com>
Message-ID: <87myl7dl9w.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "sjhill" == sjhill  <sjhill@realitydiluted.com> writes:

[resent with stripped to: to please mailman
]
Hi,

 >> > Daniel> I use buildroot actively in my company and have kept up to
 >> > Daniel> date pretty well.  However we are still using busybox 1.2.2.1
 >> 
 >> And what's the reason for you doing this? Do you like huge .bss and just
 >> don't want to benefit from the improvements that went into busybox
 >> during the last years?
 >> 

 sjhill> Because some applets work in 1.2.2.1 that don't in newer
 sjhill> versions, like telnetd for example.

Ohh, what's the problem? I don't use it myself, but openwrt afaik uses
it on 1.8.x

 >> If there are regressions (something worked with 1.2.2.1 but fails with
 >> 1.11.0) no matter if they are behavioural or size-regressions, then you
 >> would be better off to report those to the busybox list.
 >> 

 sjhill> Some of us live in the real world where once we ship a
 sjhill> product and start providing updates, it becomes cost
 sjhill> prohibitive to requalify all the software on a platform to
 sjhill> make sure everything still plays together.

So I guess you freeze your buildroot snapshot as well?

A missing 1.2.2.1 should only be a problem for people starting new
development and wanting to use 1.2.2.1 (which they shouldn't) - right?

 >> >So you are still doing active development (E.G. buildroot stuff) on a
 >> >project where you cannot change the busybox version? 
 >> >
 >> > Daniel> So I vote for not removing just deprecating :-)
 >> >
 >> >Ok, anyone still using 1.6 .. 1.8?
 >> 
 sjhill> I vote for deprecating.

Ok, noted.

But this is bigger than just busybox ofcause - It also goes for all
other packages.

-- 
Bye, Peter Korsgaard
