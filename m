From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 18 Sep 2008 12:34:37 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/pcre
In-Reply-To: <19549945.post@talk.nabble.com> (Daniel Laird's message of "Thu\,
	18 Sep 2008 03\:28\:49 -0700 \(PDT\)")
References: <20080917213320.62BE93C670@busybox.net>
	<19549945.post@talk.nabble.com>
Message-ID: <87fxnxn3nm.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniel" == Daniel Laird <daniel.j.laird@nxp.com> writes:

 Daniel> There are a number of files that require this 'editing'
 Daniel> xml2-config, xslt-config, freetype-config and now pcre-config
 Daniel> off the top of my head.

 Daniel> Maybe we could add to Makefile.autotools.in a check for
 Daniel> STAGINGDIR/usr/bin/$PKG-config
 Daniel> If it exists edit it 

Yeah, if we can come up with a generic sed line, then I'm all for it.

-- 
Bye, Peter Korsgaard
