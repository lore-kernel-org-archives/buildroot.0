From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 14 Feb 2012 12:27:29 +0100
Subject: [Buildroot] [git commit] python: workaround distutils issue
	with binary extensions
In-Reply-To: <4F3A3169.9080109@visionsystems.de> (Yegor Yefremov's message of
 "Tue, 14 Feb 2012 11:03:21 +0100")
References: <20120214095225.A3DBC90A9D@busybox.osuosl.org>
 <4F3A3169.9080109@visionsystems.de>
Message-ID: <8762f9wt7i.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yegor" == Yegor Yefremov <yegor_sub1@visionsystems.de> writes:

Hi,

 Yegor> I hope this talk will change the situation in the future: https://us.pycon.org/2012/schedule/presentation/11/.

Yes, let's hope so.

 Yegor> I've tried to raise this issue in distutils mailing list, but no
 Yegor> one answered:
 Yegor> http://python.6.n6.nabble.com/RFC-real-cross-compiling-support-for-Distutils2-td4368968.html

Thanks.

 Yegor> Peter, have you tried to make the following python patches upstream?

No, I haven't. I'm not the author of them (Thomas did - I think he based
them on patches in openwrt).

-- 
Bye, Peter Korsgaard
