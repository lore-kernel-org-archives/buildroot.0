From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 18 Jun 2016 10:46:58 +0200
Subject: [Buildroot] Emails being substituted when reading via Gmane NNTP
In-Reply-To: <1466178031.23608.9.camel@synopsys.com> (Alexey Brodkin's message
 of "Fri, 17 Jun 2016 15:41:25 +0000")
References: <1466149048.31770.11.camel@synopsys.com>
 <87ziqk6vu2.fsf@dell.be.48ers.dk>
 <1466178031.23608.9.camel@synopsys.com>
Message-ID: <87vb167ukd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexey" == Alexey Brodkin <Alexey.Brodkin@synopsys.com> writes:

Hi,

 >> I believe that is an intentional feature of gmane to make it more
 >> difficult to harvest email addresses:
 >> 
 >> http://gmane.org/tmda.php
 >> 
 >> According to that page, this is something you as a list maintainer can
 >> control (but users can enforce it for their mails).

 > So for Buildroot your guys intentionally enabled that feature?

I think it is on by default - I at least don't recall explicitly
enabling it.

 > Even though idea is nice still in the "original" Buildroot list
 > all emails are displayed as they are, see
 > http://lists.busybox.net/pipermail/buildroot/2016-June/164199.html:
 -------------------------> 8-----------------------
 > Romain Naour romain.naour at gmail.com?
 -------------------------> 8-----------------------

 > Given that probably that's not much sense in doing email obfuscation
 > in Gmane? IMHO it adds more trouble for good people than adds problems
 > to bad guys.

Notice that the obfuscated email addresses DO work. They simply get
forwarded through gmane's spam filter.

But yeah, it probably doesn't help much in combating spam.

-- 
Venlig hilsen,
Peter Korsgaard 
