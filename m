From: Michael J. Hammel <buildroot@graphics-muse.org>
Date: Sun, 27 Mar 2011 13:19:11 -0600
Subject: [Buildroot] Buildroot in use
In-Reply-To: <779935.72384.qm@web161802.mail.bf1.yahoo.com>
References: <1D6034426110564DA0DEA9EE9793B3835815AE17BF@NBE-MBX01.americas.swk.pri>
	<20110315180743.5e34890b@surf>
	<1D6034426110564DA0DEA9EE9793B3835815AE19D2@NBE-MBX01.americas.swk.pri>
	<20110315192211.3c59f861@surf>
	<1D6034426110564DA0DEA9EE9793B3835815AE1A1F@NBE-MBX01.americas.swk.pri>
	<20110315210538.1973f87f@surf>
	<779935.72384.qm@web161802.mail.bf1.yahoo.com>
Message-ID: <1301253551.2716.46.camel@galileo.graphics-muse.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 2011-03-16 at 09:44 -0700, Steve Calfee wrote:
> I think a general discussion of how we use buildroot and what we would like to 
> see is in order. It seems the framework is stabilizing and useful (thanks guys).

This thread got me thinking about how and why I created BeagleBox, which
is a metabuild that wraps other metabuilds like Buildroot and
Crosstool-NG.  The structure is based on experience from a number of
previous projects I did at work and heavily on what I learned trying to
track down the bits and pieces that work for BeagleBoard.

So I thought it might be of some value to write up a paper on the how's
and why's of it all for metabuilds.  I've placed the paper online for
critique.  

http://www.graphics-muse.org/wiki/pmwiki.php?n=Papers.MetabuildsForEmbeddedDevelopment

I'm open to updates, clarifications, omissions, extensions, etc.  I
expect some to disagree with my analysis and welcome corrections.  I'd
like this to be useful for those new to the field.  I'm also open to
moving this to a more useful site such as elinux.org or Buildroot's web
site if anyone thinks it would be appropriate.

Some of it is very basic if you've been doing this for very long.  The
interesting stuff for the more experienced is in "The Build Workflow"
section and below.
-- 
Michael J. Hammel <buildroot@graphics-muse.org>
