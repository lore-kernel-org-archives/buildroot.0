From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 30 Sep 2009 09:03:26 +0200
Subject: [Buildroot] problems building git head
In-Reply-To: <1254291803.810.0.camel@coalu.atr> (Lionel Landwerlin's message
	of "Wed\, 30 Sep 2009 08\:23\:23 +0200")
References: <c166aa9f0909291340j54ae2835o233fad9d89fdf96b@mail.gmail.com>
	<87fxa5pif5.fsf@macbook.be.48ers.dk>
	<c166aa9f0909291514o4ba70e3p277df9dc924f9bb6@mail.gmail.com>
	<c166aa9f0909292211n7da2f8c0qb6adbde34a2a10f3@mail.gmail.com>
	<1254291803.810.0.camel@coalu.atr>
Message-ID: <877hvgq5hd.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Lionel" == Lionel Landwerlin <lionel.landwerlin@openwide.fr> writes:

Hi,

 Lionel> I had the same problem with gnu make 3.80. Switched to 3.81, it
 Lionel> fixed the problem.

It does indeed seem like make 3.80 doesn't like our
Makefile.autotools.in stuff. I'll update the dependencies check to
match.

Thanks both of you.

-- 
Bye, Peter Korsgaard
