From: Ormund Williams <ormundw@panix.com>
Date: Fri, 08 Jun 2007 07:41:59 -0400
Subject: [Buildroot] Building buildroot with threads
In-Reply-To: <f0528b5b0706080125n18eeb685q3ea7472c396803bf@mail.gmail.com>
References: <1180989229.4532.44.camel@localhost.localdomain>
	<20070604205913.GE2853@aon.at>
	<1181277467.4898.11.camel@localhost.localdomain>
	<f0528b5b0706080125n18eeb685q3ea7472c396803bf@mail.gmail.com>
Message-ID: <1181302920.4898.14.camel@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 2007-06-08 at 10:25 +0200, Julien Letessier wrote:
> 2007/6/8, Ormund Williams <ormundw@panix.com>:
> > On Mon, 2007-06-04 at 22:59 +0200, Bernhard Fischer wrote:
> > > 0.9.29 works fine with threads here. The thread impl highly depends on
> > > your target, ATM. Read the helptext of the thread-impl selection and
> > > the ML archives for futher details.
> >
> > My target is i386, what's yours?
> My target also is i386. Vanilla buildroot (today's trunk) builds with
> linuxthreads-old, but I never got it to work with NPTL.
> 
Thanks Julien,

I'll give that another try.

__
Ormund
