From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 11 Jul 2011 22:06:49 +0200
Subject: [Buildroot] [PATCH 07/12] u-boot: allow specification of custom
	Git repo as source
In-Reply-To: <20110711214456.2eebfc37@skate> (Thomas Petazzoni's message of
 "Mon, 11 Jul 2011 21:44:56 +0200")
References: <cover.1310392269.git.thomas.petazzoni@free-electrons.com>
 <cover.1310392269.git.thomas.petazzoni@free-electrons.com>
 <6c2e3e2e44b61f427fa861ce4c7d5d76eb48682a.1310392269.git.thomas.petazzoni@free-electrons.com>
 <87ipr8liaq.fsf@macbook.be.48ers.dk> <20110711214456.2eebfc37@skate>
Message-ID: <87sjqck2ee.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Le Mon, 11 Jul 2011 21:38:05 +0200,
 Thomas> Peter Korsgaard <jacmet@uclibc.org> a ?crit :

 >> Otherwise it looks good. The only possible improvement would be to
 >> make it simply a custum URL, and let the Makefile.package.in support
 >> sort out if it's a tarball, a svn repo or git or whatever.

 Thomas> This would rule out support for SVN over HTTP and Git over HTTP.

Yes, unless we extend the logic in Makefile.package.in to support
pseudo URLs like OE, something like <url>;method=<method> or
<method>;<url>.

But ok, we can do that later.

-- 
Bye, Peter Korsgaard
