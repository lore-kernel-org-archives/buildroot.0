From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 27 Jun 2008 14:00:11 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
In-Reply-To: <87y74ri68u.fsf@macbook.be.48ers.dk>
References: <20080626065112.3F4CB3C289@busybox.net>
	<877iccn0ml.fsf@macbook.be.48ers.dk>
	<18151015.post@talk.nabble.com>
	<87y74ri68u.fsf@macbook.be.48ers.dk>
Message-ID: <20080627120011.GD32468@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jun 27, 2008 at 11:20:33AM +0200, Peter Korsgaard wrote:
>>>>>> "Daniel" == Daniel Laird <daniel.j.laird@nxp.com> writes:
>
>Hi,
>
> Daniel> I use buildroot actively in my company and have kept up to
> Daniel> date pretty well.  However we are still using busybox 1.2.2.1

And what's the reason for you doing this? Do you like huge .bss and just
don't want to benefit from the improvements that went into busybox
during the last years?

If there are regressions (something worked with 1.2.2.1 but fails with
1.11.0) no matter if they are behavioural or size-regressions, then you
would be better off to report those to the busybox list.

> Daniel> in some cases.  Marking as deprecated is fine, removing
> Daniel> completely would mean me having to hold local patches to keep
> Daniel> the ability to upgrade buildroot yet not change busybox
> Daniel> versions.
>
>So you are still doing active development (E.G. buildroot stuff) on a
>project where you cannot change the busybox version? 
>
> Daniel> So I vote for not removing just deprecating :-)
>
>Ok, anyone still using 1.6 .. 1.8?

There is only one valid reason to keep the last version of a given x.y
series: so that people can easily report regressions.
