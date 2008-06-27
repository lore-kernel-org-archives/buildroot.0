From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 27 Jun 2008 14:53:27 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
In-Reply-To: <20080627124653.GA31649@real.realitydiluted.com>
References: <20080626065112.3F4CB3C289@busybox.net>
	<877iccn0ml.fsf@macbook.be.48ers.dk>
	<18151015.post@talk.nabble.com>
	<87y74ri68u.fsf@macbook.be.48ers.dk>
	<20080627120011.GD32468@mx.loc>
	<20080627124653.GA31649@real.realitydiluted.com>
Message-ID: <20080627125327.GD516@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jun 27, 2008 at 07:46:53AM -0500, sjhill at realitydiluted.com wrote:
>> >
>> > Daniel> I use buildroot actively in my company and have kept up to
>> > Daniel> date pretty well.  However we are still using busybox 1.2.2.1
>> 
>> And what's the reason for you doing this? Do you like huge .bss and just
>> don't want to benefit from the improvements that went into busybox
>> during the last years?
>> 
>Because some applets work in 1.2.2.1 that don't in newer versions, like
>telnetd for example.
>
>> If there are regressions (something worked with 1.2.2.1 but fails with
>> 1.11.0) no matter if they are behavioural or size-regressions, then you
>> would be better off to report those to the busybox list.
>> 
>Some of us live in the real world where once we ship a product and start

Come on, Steven. "Real" world doesn't mean you are prohibited to report
bugs if you encounter them.

>providing updates, it becomes cost prohibitive to requalify all the
>software on a platform to make sure everything still plays together.

Of course. But if you know that something broke then it would be nice to
report this brokenness so that it can be fixed.
