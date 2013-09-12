From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 13 Sep 2013 00:23:58 +0200
Subject: [Buildroot] [git commit] libsoc: add new package
In-Reply-To: <52323C55.4010201@mind.be> (Arnout Vandecappelle's message of
 "Fri, 13 Sep 2013 00:12:37 +0200")
References: <20130912203028.B34909B295@busybox.osuosl.org>
 <52323C55.4010201@mind.be>
Message-ID: <87vc25of0h.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 >> +LIBSOC_VERSION = 356760dcb93b22d6c67c5232cde2ade8c968c932
 >> +LIBSOC_SITE = http://github.com/jackmitch/libsoc/tarball/$(LIBSOC_VERSION)
 >> +LIBSOC_LICENSE = LGPLv2.1

 Arnout>  Actually, according to the (L)GPL text:

 Arnout> "If the Library does not specify a
 Arnout> license version number, you may choose any version ever published by
 Arnout> the Free Software Foundation."

 Arnout>  Since none of the source file specify a license, let alone a version,
 Arnout> I guess it should be LGPLv2.1+.

Well, the README clearly says:

libsoc is licenced under the LGPLv2.1, please see the COPYING files for
futher details.

So I've kept it at LGPLv2.1

-- 
Bye, Peter Korsgaard
