From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 07 Aug 2019 09:12:36 +0200
Subject: [Buildroot] [PATCH] host-localedef: Compile against glibc-2.29
In-Reply-To: <87a7e6jijt.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Tue, 25 Jun 2019 08:16:54 +0200")
References: <20190619020707.3798-1-sam@mendozajonas.com>
 <20190619134812.4bd672e7@windsurf> <87k1dan7cv.fsf@dell.be.48ers.dk>
 <cab0e23381beef9e4f8d9e895e6025c110cd2abd.camel@mendozajonas.com>
 <87a7e6jijt.fsf@dell.be.48ers.dk>
Message-ID: <87wofpmot7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Samuel" == Samuel Mendoza-Jonas <sam@mendozajonas.com> writes:
 > Hi,

 >>> 2019.02.x is using glibc-2.28. Is using this 2.29-based localedef the
 >>> right solution for 2019.02.x, or should we be using something 2.28
 >>> based?
 >>> 

 >> I've not tested with a localedef ahead of glibc, but if we want to fix up
 >> 2019.02 as well then basically the same patch minus the 2.28->2.29
 >> updates should work fine, eg:
 >> https://github.com/sammj/buildroot/commit/7fedd772a6caac0cbc69a90a8c1da8c142eae9ac

 >> (not directly tested, but that's the same as what we've been running in our
 >> 2019.02-based op-build tree)

 > Great, could you send a patch for 2019.02.x with this?

I don't think you ever sent such a patch. Can you please do so? Thanks

-- 
Bye, Peter Korsgaard
