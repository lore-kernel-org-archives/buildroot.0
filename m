From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 12 Jan 2013 21:17:29 +0100
Subject: [Buildroot] [PATCH 03/10] libxmlrpc: new package
In-Reply-To: <20120605232646.0367dff5@skate> (Thomas Petazzoni's message of
 "Tue, 5 Jun 2012 23:26:46 +0200")
References: <cover.1338653505.git.thomas.petazzoni@free-electrons.com>
 <d6e101fca46d16dbd2ebd312240f6b7de6bda48a.1338653505.git.thomas.petazzoni@free-electrons.com>
 <4FCD4B6D.3080506@mind.be> <20120605232646.0367dff5@skate>
Message-ID: <87mwwe5f6u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi Thomas,

Old mail ..

 Thomas> Hello,
 Thomas> Le Tue, 05 Jun 2012 01:57:33 +0200,
 Thomas> Arnout Vandecappelle <arnout@mind.be> a ?crit :

 >> On 06/02/12 18:13, Thomas Petazzoni wrote:
 >> > +LIBXMLRPC_VERSION = 1.18.05
 >> > +LIBXMLRPC_SOURCE = xmlrpc-c-$(LIBXMLRPC_VERSION).tgz
 >> > +LIBXMLRPC_SITE ="http://xmlrpc-c.svn.sourceforge.net/viewvc/xmlrpc-c/advanced/?view=tar&pathrev=1716"
 >> 
 >> It's a bit strange to use a three-year-old unstable version...
 >> From the website:
 >> 
 >> Latest Tarballs
 >> Series		Number
 >> Development	unnumbered
 >> Advanced	1.30.06
 >> Stable		1.25.16
 >> Super Stable	1.16.41

 Thomas> This package comes from a customer project, and the customer had its
 Thomas> software running with this version, so that's the version I tested. Of
 Thomas> course, packaging more recent versions would be better, but I thought
 Thomas> that having the package would be better than nothing.

 >> A simpler solution would be to just use the svn download method, from
 >> https://xmlrpc-c.svn.sourceforge.net/svnroot/xmlrpc-c/stable/

 Thomas> Sure, I'll look into that.

Any news on this?

-- 
Bye, Peter Korsgaard
