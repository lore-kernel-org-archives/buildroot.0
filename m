From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 12 Sep 2012 22:50:36 +0200
Subject: [Buildroot] [git commit] package: add opus audio codec library
In-Reply-To: <5050B456.6040807@mind.be> (Arnout Vandecappelle's message of
 "Wed, 12 Sep 2012 18:12:06 +0200")
References: <20120912073358.E363B99621@busybox.osuosl.org>
 <5050B456.6040807@mind.be>
Message-ID: <87bohbt17n.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 Arnout> On 09/11/12 22:50, Peter Korsgaard wrote:
 >> +OPUS_CONF_OPT = --disable-doc
 Arnout> That should depend on BR2_HAVE_DOCUMENTATION, no?

This is doxygen generated documentation, so not really. We so far don't
have a host-doxygen package for that kind of stuff.

-- 
Bye, Peter Korsgaard
