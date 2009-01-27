From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 27 Jan 2009 14:02:34 +0100
Subject: [Buildroot] svn
	commit:	trunk/buildroot/package/multimedia/mplayer
In-Reply-To: <20090127125835.GA18681@cloud.net.au> (Hamish Moffatt's message
	of "Tue\, 27 Jan 2009 23\:58\:35 +1100")
References: <20090126092249.54682768D3@busybox.osuosl.org>
	<20090127005212.GC1083@cloud.net.au>
	<87fxj52t0c.fsf@macbook.be.48ers.dk>
	<20090127125835.GA18681@cloud.net.au>
Message-ID: <87eiyo2979.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hamish" == Hamish Moffatt <hamish@cloud.net.au> writes:

 Hamish> I had a similar problem building OpenSSL with uclibc
 Hamish> 0.9.30. I will fix it later today if I get a chance.
 >> 
 >> With svn trunk? I checked in a 0.9.30 fix back in December (r24578).

 Hamish> Weird, I should have that patch. I'll check tomorrow. Thanks.

Notice that Makefile.autotools.in normally only applies patches if the
filename matches <package>-<version>-*.patch, so if you locally
updated openssl and didn't rename the patches then that might be why.

-- 
Bye, Peter Korsgaard
