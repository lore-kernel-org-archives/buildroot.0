From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 16 Mar 2012 00:01:55 +0100
Subject: [Buildroot] [git commit] libfuse: fix download URL
In-Reply-To: <201203152350.18988.arnout@mind.be> (Arnout Vandecappelle's
 message of "Thu, 15 Mar 2012 23:50:18 +0100")
References: <20120315081313.4521190D8E@busybox.osuosl.org>
 <201203152350.18988.arnout@mind.be>
Message-ID: <877gylqxi4.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 Arnout> On Thursday 15 March 2012 09:12:47 Peter Korsgaard wrote:
 >> -LIBFUSE_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/fuse/
 >> +LIBFUSE_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/fuse/fuse-2.X/$(LIBFUSE_VERSION)

 Arnout> $ git grep -l dl.sourceforge.net/sourceforge | wc -l
 Arnout> 71

 Arnout>  Oops, looks like we have a bit of work here...

Indeed. I haven't noticed any official notice from sf.net that they have
changed the URLs on purpose (and that it will be permanent) though.

-- 
Bye, Peter Korsgaard
