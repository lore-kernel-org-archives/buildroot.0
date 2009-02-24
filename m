From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 24 Feb 2009 15:10:23 +0100
Subject: [Buildroot] glibc philosophy
In-Reply-To: <1235484053.27200.7.camel@penguin> (jeff angielski's message of
	"Tue\, 24 Feb 2009 09\:00\:53 -0500")
References: <1235484053.27200.7.camel@penguin>
Message-ID: <871vto0vu8.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "jeff" == jeff angielski <jeff@theptrgroup.com> writes:

Hi,

 jeff> Is there a plan to support building glibc from scratch in buildroot,
 jeff> just like uclibc is currently supported?  

It's afaik not on the radar of any of the BR developers.

 jeff> Or is the official stance to only allow buildroot to build against
 jeff> pre-compiled glibc toolchains?

That depends. If someone submits clean enough patches to do it, and
people are willing to support it, then I don't see any problem with
doing it.

But I'm not personally interested in it, so I won't be working on it.

-- 
Bye, Peter Korsgaard
