From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 27 Oct 2009 08:48:57 +0100
Subject: [Buildroot] Autoconf building : dash on Ubuntu breaking stuff
In-Reply-To: <9A4A63908408452FA247F51FD452EA4F@apexjs> (Sagaert Johan's
	message of "Tue\, 27 Oct 2009 00\:56\:39 +0100")
References: <9A4A63908408452FA247F51FD452EA4F@apexjs>
Message-ID: <87iqe1e0pi.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sagaert" == Sagaert Johan <sagaert.johan@skynet.be> writes:

 Sagaert> Hi guys
 Sagaert> just wanted to  add this :
 
 Sagaert> after knowing dash is the culprit  i found this
 
 Sagaert> https://bugs.launchpad.net/ubuntu/+source/dash/+bug/141481

Yes, there's quite a lot of stuff expecting /bin/sh == bash, but I would
have expected the autoconf maintainers of all people to do better.

-- 
Bye, Peter Korsgaard
