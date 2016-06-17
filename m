From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 17 Jun 2016 10:52:37 +0200
Subject: [Buildroot] Emails being substituted when reading via Gmane NNTP
In-Reply-To: <1466149048.31770.11.camel@synopsys.com> (Alexey Brodkin's
 message of "Fri, 17 Jun 2016 07:38:22 +0000")
References: <1466149048.31770.11.camel@synopsys.com>
Message-ID: <87ziqk6vu2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexey" == Alexey Brodkin <Alexey.Brodkin@synopsys.com> writes:

 > Hi Thomas, Peter,
 > I'm wondering if that's an expected behavior or my NNTP reader is broken
 > (even though both Evolution's built-in reader and stand-alone Pan reader
 > behave exactly the same so probably it's not a client who's guilty).

 > So when reading Buildroot mailing list via NNTP client connected to Gmane
 > I see this kind of information in message source in Evolution's NNTP reader:
 -------------------------> 8---------------------
 > Path: news.gmane.org!not-for-mail
 > From: Romain Naour <romain.naour-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

I believe that is an intentional feature of gmane to make it more
difficult to harvest email addresses:

http://gmane.org/tmda.php

According to that page, this is something you as a list maintainer can
control (but users can enforce it for their mails).

-- 
Venlig hilsen,
Peter Korsgaard 
