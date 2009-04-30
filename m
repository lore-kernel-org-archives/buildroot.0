From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 30 Apr 2009 21:05:18 +0200
Subject: [Buildroot] HEADS UP: svn->git transition
In-Reply-To: <200904302047.33996.vda.linux@googlemail.com> (Denys Vlasenko's
	message of "Thu\, 30 Apr 2009 20\:47\:33 +0200")
References: <20090429113849.GB18534@mx.loc>
	<200904301248.33425.vda.linux@googlemail.com>
	<87y6ti9y26.fsf@macbook.be.48ers.dk>
	<200904302047.33996.vda.linux@googlemail.com>
Message-ID: <87fxfq9d3l.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Denys" == Denys Vlasenko <vda.linux@googlemail.com> writes:

Hi,

 Denys> Which email are you referring to?

Ehm, the mails between us and osuosl.org staff about switching the
uclibc.org projects from svn to git. The first mail was afaik:

From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Subject: uClibc: switching from svn to git
To: support at osuosl.org
Cc: vapier at gentoo.org, solar at gentoo.org, vda.linux at googlemail.com,
	jacmet at uclibc.org
Date: Wed, 18 Feb 2009 21:16:54 +0100

Did you never read them?

 >> So why didn't you do anything about it in the last month?

 Denys> I didn't do anything because I am not a person which performs
 Denys> svn->git migration. I am just one of svn users (which happens
 Denys> to have write access too).

.. And busybox maintainer.

 Denys> So far I read all relevant emails and I do not see instructions
 Denys> how can I check out new tree. (I will also need instructions
 Denys> how to push/commit/latest_fashionable_term_of_the_week_for_it
 Denys> changes).

Again, my mail to the buildroot list described the setup for BR. I
don't quite know how you will do it for busybox / uclibc, but the
basic stuff stays the same.

To quote:

The repo can be browsed through cgit at:

http://git.buildroot.net/buildroot/

It can be cloned anonymously using:

git clone git://git.buildroot.net/buildroot/ or
git clone http://git.buildroot.net/buildroot/ if you're behind a
firwall blocking git access.

Developers can also access the repo over ssh with:

git clone ssh://uclibc.org/var/lib/git/buildroot.git

replace buildroot with busybox or uclibc and you should be good to go.

 Denys> Such instructions can't possibly be longer than 2 to 5 lines.
 Denys> This is the minimum necessary for users and developers to migrate.
 Denys> If I missed an email which contains them, I apoligize.

More like 73 mails ;)

-- 
Bye, Peter Korsgaard
