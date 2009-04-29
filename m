From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 29 Apr 2009 15:43:19 +0200
Subject: [Buildroot] HEADS UP: svn->git transition
In-Reply-To: <20090429132312.GA2431@yoda.jdub.homelinux.org> (Josh Boyer's
	message of "Wed\, 29 Apr 2009 09\:23\:12 -0400")
References: <20090429113849.GB18534@mx.loc> <49F85AF3.4060501@t-online.de>
	<49F84E53.8060202@walsimou.com>
	<20090429132312.GA2431@yoda.jdub.homelinux.org>
Message-ID: <87hc07d18o.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Josh" == Josh Boyer <jwboyer@gmail.com> writes:

Hi,

 Josh> Presumably you'll have a primary repo somewhere, and the
 Josh> maintainer(s) of that project will do pull from developer's
 Josh> repositories into their own local copies.  After vetting
 Josh> changes, the maintainer(s) will do a 'git push' to the primary
 Josh> public repo.

Indeed. See http://git.buildroot.net for the cgit interface to the
official repositories (the final sync with svn is still to be done).

I wrote a mail with some more details about it on the buildroot list
last month:

http://lists.busybox.net/pipermail/buildroot/2009-March/026875.html

-- 
Bye, Peter Korsgaard
