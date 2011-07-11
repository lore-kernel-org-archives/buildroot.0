From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Jul 2011 21:44:56 +0200
Subject: [Buildroot] [PATCH 07/12] u-boot: allow specification of custom
 Git repo as source
In-Reply-To: <87ipr8liaq.fsf@macbook.be.48ers.dk>
References: <cover.1310392269.git.thomas.petazzoni@free-electrons.com>
 <cover.1310392269.git.thomas.petazzoni@free-electrons.com>
 <6c2e3e2e44b61f427fa861ce4c7d5d76eb48682a.1310392269.git.thomas.petazzoni@free-electrons.com>
 <87ipr8liaq.fsf@macbook.be.48ers.dk>
Message-ID: <20110711214456.2eebfc37@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 11 Jul 2011 21:38:05 +0200,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

> Otherwise it looks good. The only possible improvement would be to
> make it simply a custum URL, and let the Makefile.package.in support
> sort out if it's a tarball, a svn repo or git or whatever.

This would rule out support for SVN over HTTP and Git over HTTP.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
