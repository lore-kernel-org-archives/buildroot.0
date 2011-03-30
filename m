From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 30 Mar 2011 20:53:40 +0200
Subject: [Buildroot] fix for package/config/util.c
In-Reply-To: <20110330155237.111340@gmx.net> (bbj's message of "Wed, 30 Mar
	2011 17:52:37 +0200")
References: <20110330155237.111340@gmx.net>
Message-ID: <87d3l81lu3.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "bbj17" == bbj17  <bbj17@gmx.de> writes:

 bbj17> I found a bug in package/config/util.c
 bbj17> (package/config/patches/08-make-write-deps.patch).  Symbols not
 bbj17> starting with BR2_ / PACKAGE_ / TARGET_ will result in memory
 bbj17> corruption.

Committed, thanks.

-- 
Bye, Peter Korsgaard
