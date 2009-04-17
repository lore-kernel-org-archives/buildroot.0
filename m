From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 17 Apr 2009 07:20:18 +0200
Subject: [Buildroot] Properly setting up hotplug
In-Reply-To: <20090417004209.GA12990@cloud.net.au> (Hamish Moffatt's message
	of "Fri\, 17 Apr 2009 10\:42\:09 +1000")
References: <20090414103327.2fd69516@danhplaptop>
	<87eivtx0c4.fsf@macbook.be.48ers.dk> <20090416091027.6c6153fe@surf>
	<87ocuwa390.fsf@macbook.be.48ers.dk>
	<20090417004209.GA12990@cloud.net.au>
Message-ID: <87fxg7amb1.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hamish" == Hamish Moffatt <hamish@cloud.net.au> writes:

Hi,

 Hamish> Are the individual package -clean targets of any value? I never use
 Hamish> them, you are just rebuilding from the same source so what's changed?

I do use them while developing - E.G. tweak something in the config
and do make <target>-{,dir}clean; make to test.

-- 
Bye, Peter Korsgaard
