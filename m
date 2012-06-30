From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 01 Jul 2012 00:01:32 +0200
Subject: [Buildroot] [git commit] mii-diag: link statically if
	configured to do so
In-Reply-To: <4FEEF8D4.4080702@mind.be> (Arnout Vandecappelle's message of
 "Sat, 30 Jun 2012 15:02:12 +0200")
References: <20120627200833.E3F7C8E0E8@busybox.osuosl.org>
 <20120629121602.1b0fecd6@skate> <87txxt42up.fsf@macbook.be.48ers.dk>
 <20120630105559.7e57508a@skate> <4FEEF8D4.4080702@mind.be>
Message-ID: <874nps4fyb.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 Arnout>  --enable-static should mean that static libraries should be built,
 Arnout> while -static says that the executable should only be linked with
 Arnout> static libraries.  But of course, with all the non-standard autotools
 Arnout> stuff out there, you never know...

 Arnout>  I expect that adding -static to LDFLAGS will break quite a few
 Arnout> packages.  Would it be possible to add a BR2_PREFER_STATIC_LIB
 Arnout> test to the autobuilds?

I haven't seen any breakage in my (admitted fairly limited) testing, but
it it certainly possible.

I'll add a static builder to the autobuilders now.

-- 
Bye, Peter Korsgaard
