From: Waldemar Brodkorb <wbx@openadk.org>
Date: Wed, 22 Jun 2016 20:23:00 +0200
Subject: [Buildroot] Emails being substituted when reading via Gmane NNTP
In-Reply-To: <1466178031.23608.9.camel@synopsys.com>
References: <1466149048.31770.11.camel@synopsys.com>
 <87ziqk6vu2.fsf@dell.be.48ers.dk>
 <1466178031.23608.9.camel@synopsys.com>
Message-ID: <20160622182300.GK2584@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi ALexey,
Alexey Brodkin wrote,

> Hi Peter,
> 
> On Fri, 2016-06-17 at 10:52 +0200, Peter Korsgaard wrote:
> > > 
> > > > 
> > > > > 
> > > > > > 
> > > > > > > 
> > > > > > > "Alexey" == Alexey Brodkin <Alexey.Brodkin@synopsys.com> writes:
> > ?> Hi Thomas, Peter,
> > ?> I'm wondering if that's an expected behavior or my NNTP reader is broken
> > ?> (even though both Evolution's built-in reader and stand-alone Pan reader
> > ?> behave exactly the same so probably it's not a client who's guilty).
> > 
> > ?> So when reading Buildroot mailing list via NNTP client connected to Gmane
> > ?> I see this kind of information in message source in Evolution's NNTP reader:
> > ?-------------------------> 8---------------------
> > ?> Path: news.gmane.org!not-for-mail
> > ?> From: Romain Naour <romain.naour-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > 
> > I believe that is an intentional feature of gmane to make it more
> > difficult to harvest email addresses:
> > 
> > http://gmane.org/tmda.php
> > 
> > According to that page, this is something you as a list maintainer can
> > control (but users can enforce it for their mails).
> 
> So for Buildroot your guys intentionally enabled that feature?
> 
> Even though idea is nice still in the "original" Buildroot list
> all emails are displayed as they are, see
> http://lists.busybox.net/pipermail/buildroot/2016-June/164199.html:
> ------------------------->8-----------------------
> Romain Naour romain.naour at gmail.com?
> ------------------------->8-----------------------
> 
> Given that probably that's not much sense in doing email obfuscation
> in Gmane? IMHO it adds more trouble for good people than adds problems
> to bad guys.

I disabled address encryption for uClibc-ng mailinglist, does it work now for you?

best regards
 Waldemar
