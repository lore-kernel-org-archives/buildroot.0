From: Julien Letessier <julien.letessier@technosens.fr>
Date: Fri, 8 Jun 2007 10:25:12 +0200
Subject: [Buildroot] Building buildroot with threads
In-Reply-To: <1181277467.4898.11.camel@localhost.localdomain>
References: <1180989229.4532.44.camel@localhost.localdomain>
	<20070604205913.GE2853@aon.at>
	<1181277467.4898.11.camel@localhost.localdomain>
Message-ID: <f0528b5b0706080125n18eeb685q3ea7472c396803bf@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2007/6/8, Ormund Williams <ormundw@panix.com>:
> On Mon, 2007-06-04 at 22:59 +0200, Bernhard Fischer wrote:
> > 0.9.29 works fine with threads here. The thread impl highly depends on
> > your target, ATM. Read the helptext of the thread-impl selection and
> > the ML archives for futher details.
>
> My target is i386, what's yours?
My target also is i386. Vanilla buildroot (today's trunk) builds with
linuxthreads-old, but I never got it to work with NPTL.


-- 
Julien Letessier
<julien.letessier@technosens.fr>
