From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 28 Sep 2012 11:48:57 +0200
Subject: [Buildroot] [git commit] xlib_libSM: only build documentation
	if needed
In-Reply-To: <5064C9A3.8040305@mind.be> (Arnout Vandecappelle's message of
 "Thu, 27 Sep 2012 23:48:19 +0200")
References: <20120926212531.70C0399722@busybox.osuosl.org>
 <5064C9A3.8040305@mind.be>
Message-ID: <871uhm7a0m.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 Arnout> Roughly 45 packages have some form of --disable-doc, with variants

 Arnout> --disable-doc
 Arnout> --disable-docs
 Arnout> --disable-documentation

 Arnout> Maybe we should just add all three to the common configure options?

Yes, that imho makes sense. For some packages, the documentation
generation step is a significant part of the build time.

Care to submit a patch?

-- 
Bye, Peter Korsgaard
