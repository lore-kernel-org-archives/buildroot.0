From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 23 Oct 2008 16:48:00 +0200
Subject: [Buildroot] New to embedded Linux... questions ref.  buildroot
In-Reply-To: <6.2.5.6.2.20081023103240.02fb21b0@rkt-tech.com> (Eric's message
	of "Thu\, 23 Oct 2008 10\:43\:13 -0400")
References: <6.2.5.6.2.20081023070550.02f4eb98@rkt-tech.com>
	<20081023133805.GB956@mx.loc>
	<6.2.5.6.2.20081023103240.02fb21b0@rkt-tech.com>
Message-ID: <8763njgyfz.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Eric" == Eric  <spamsink@scoot.netis.com> writes:

 Eric> At 09:38 AM 10/23/2008, Bernhard Reutner-Fischer wrote:
 >>>>>> 
 >> Note that the above is not buildroot (as should be mentioned somewhere
 >> where you downloaded it).
 Eric> <<<<<

 Eric> Uhhh ... ok ...

 Eric> If "buildroot-avr32-v2.2.0.tar.bz2" is not buildroot
 Eric> (customized for AVR32), then what is it?  I saw nothing
 Eric> anywhere I visited when I downloaded it, that said it wasn't
 Eric> the "real" buildroot.

It is, the point is that we don't know what those customizations are.

 >> http://buildroot/uClibc.org/

 Eric> That's supposed to be buildroot DOT uClibc.org, right?  I tried
 Eric> that and just got the page that says that there is a mailing
 Eric> list and a buildroot web page.  Clicking on the Downloads link
 Eric> on that page and drilling down to the Daily Snapshots gives a
 Eric> bunch of files with names like
 Eric> buildroot-2008nnnn.tar.bz2... how are those different (except
 Eric> in version and perhaps a few platform-specific content
 Eric> differences) from buildroot-avr32-v2.2.0.tar.bz2?

We don't know. Ask Atmel what they have changed and why it doesn't
work for you.

-- 
Bye, Peter Korsgaard
