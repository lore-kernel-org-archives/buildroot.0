From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 12 Dec 2009 09:02:14 +0100
Subject: [Buildroot] [PATCH 4/6] package: Added libdvdread package
	(dependency of gst-plugins-bad)
In-Reply-To: <1260584626.9059.19.camel@coalu.atr> (Lionel Landwerlin's message
	of "Sat, 12 Dec 2009 03:23:46 +0100")
References: <1260487878-21126-1-git-send-email-llandwerlin@gmail.com>
	<1260487878-21126-5-git-send-email-llandwerlin@gmail.com>
	<1260584626.9059.19.camel@coalu.atr>
Message-ID: <87ljh8tybd.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Lionel" == Lionel Landwerlin <llandwerlin@gmail.com> writes:

 Lionel> This one was broken too...

It was? It built ok here. From what I can see, the only difference
between what I committed and this (besides the upstream URL) is that you
now turned off the libtool patching - Why?

-- 
Bye, Peter Korsgaard
