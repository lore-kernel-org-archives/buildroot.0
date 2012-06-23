From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 23 Jun 2012 22:43:13 +0200
Subject: [Buildroot] [PATCH V2] inadyn: add package for inadyn DDNS
	client-updater
In-Reply-To: <1340123854-1632-1-git-send-email-david.c.purdy@gmail.com> (Dave
 Purdy's message of "Tue, 19 Jun 2012 11:37:34 -0500")
References: <1340123854-1632-1-git-send-email-david.c.purdy@gmail.com>
Message-ID: <87txy1bvz2.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Dave" == Dave Purdy <david.c.purdy@gmail.com> writes:

 Dave> inadyn is a DynamicDNS client/updater which works with
 Dave> dyndns.com, noip.com and many other DDNS providers.  It is
 Dave> minimal in footprint and requirements, supports IP caching,
 Dave> multiple providers, multiple domain names, and a variety of other
 Dave> situations.

Committed with some minor whitespace / trailing spaces fixes, thanks.

 Dave> Changes in V2: (both per Thomas Petazzoni's comments)
 Dave> 	-renamed initscript S70inadyn   
 Dave> 	-checked build against toolchains with and without IPV6 support 
 Dave> 	 (both of those builds [and their resultant binaries] were successful)

This changelog should go after the '---' line, otherwise it gets
included in the commit message.

-- 
Bye, Peter Korsgaard
