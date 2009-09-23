From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 23 Sep 2009 09:24:52 +0200
Subject: [Buildroot] Enable i830 graphics driver for DirectFB
In-Reply-To: <1253682420.451.64.camel@station1.ormlab.com> (Ormund Williams's
	message of "Wed\, 23 Sep 2009 01\:06\:59 -0400")
References: <1253682420.451.64.camel@station1.ormlab.com>
Message-ID: <87tyyurum3.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ormund" == Ormund Williams <ormundw@panix.com> writes:

 Ormund> I'm still learning to use git, so if anyone can turn these diffs into a
 Ormund> real patch I would appreciate it.

Normally you would simply commit changes locally on another branch, run
git format-patch master and then (preferably) send them with git-email or
through your normal mail program.

E.G. git checkout -b something
git commit -a
git format-patch master
git send-email --to buildroot at uclibc.org 0*.patch
git checkout master
rm 0*patch

Could you give it a try?

-- 
Bye, Peter Korsgaard
