From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 31 Jan 2009 13:42:22 +0100
Subject: [Buildroot] Error when compiling grub
In-Reply-To: <8394274C-0F54-4970-ABC4-20DF8C4D01DB@laptouchinc.com> (Daniel
	Jabbour's message of "Fri\, 30 Jan 2009 16\:28\:39 -0500")
References: <8394274C-0F54-4970-ABC4-20DF8C4D01DB@laptouchinc.com>
Message-ID: <87myd7lk9d.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniel" == Daniel Jabbour <daniel@laptouchinc.com> writes:

 Daniel> Hi,

 Daniel> When I try to use buildroot (latest SVN copy) to compile
 Daniel> grub, make fails. It seems to be getting stuck on some
 Daniel> patch. "make" output below, anyone have any ideas what's
 Daniel> going on or how I can fix this?  Thanks,

Fixed in r25178 in svn.

-- 
Bye, Peter Korsgaard
