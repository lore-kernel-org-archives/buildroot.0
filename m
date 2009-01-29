From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 29 Jan 2009 20:00:49 +0100
Subject: [Buildroot] svn commit: trunk/buildroot
In-Reply-To: <1233252276.4147.27.camel@elrond.atmel.com> (Ulf Samuelsson's
	message of "Thu\, 29 Jan 2009 19\:04\:36 +0100")
References: <20090129093412.2A2BA7741D@busybox.osuosl.org>
	<87eiymtnsw.fsf@macbook.be.48ers.dk>
	<1233252276.4147.27.camel@elrond.atmel.com>
Message-ID: <87k58eq6n2.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

 >> Did you give my proposal about letting the tgt-config.cache depend on
 >> .config a try?
 >> 

 Ulf> Not yet.
 Ulf> One issue with this is that there are things
 Ulf> that you can change in the .config
 Ulf> which will not impact the target cache.

Yes, but rather have something that makes compilation a bit slower
than having to do a manual step which might very well break the build
in unclear ways if you forget.

-- 
Bye, Peter Korsgaard
