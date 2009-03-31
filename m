From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 31 Mar 2009 23:23:03 +0200
Subject: [Buildroot] misc development news
In-Reply-To: <87d4d4md5o.fsf@macbook.be.48ers.dk> (Peter Korsgaard's message
	of "Fri\, 27 Feb 2009 10\:39\:47 +0100")
References: <87d4d4md5o.fsf@macbook.be.48ers.dk>
Message-ID: <874ox99yko.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <jacmet@uclibc.org> writes:

Hi,

 Peter>  - svn->git: Migration is starting to take shape. We have digged
 Peter>    through svn history and found proper author/email info for all
 Peter>    developers for the conversion, and the osuosl.org staff is setting
 Peter>    up gitweb, commit notifications and various minor stuff for the
 Peter>    conversion. Expect more info in ~1 weeks time.

Ok - Timing was "slightly" off, but the svn->git migration
uclibc.org-wide is almost completed. The repo can be browsed through
cgit at:

http://git.buildroot.net/buildroot/

It can be cloned anonymously using:

git clone git://git.buildroot.net/buildroot/ or
git clone http://git.buildroot.net/buildroot/ if you're behind a
firwall blocking git access.

Developers can also access the repo over ssh with:

git clone ssh://uclibc.org/var/lib/git/buildroot.git

But notice that you don't have write access, so you cannot push
changes directly. Instead push your changes to your own tree and send
pull requests to the list. You can add personal repos on uclibc.org by
storing them in ~/git/ and touching ~/git/<repo>/git-daemon-export-ok,
after which the hourly cronjob will pick them up and show them in
cgit.

I would like us to move to a setup similar to the kernel/uboot, where
all changes get posted to the list before they get committed to the
tree, and with package / sub-tree maintainers.

The repo was synched on the 17th, so it's missing the latest
changes. The svn repo will be turned read only once the final sync is
done, but more info about that later.

 Peter> - release: We're still on track for a 2009.05 release. Remember, the
 Peter>   tree closes end April for new features when I'll cut the first
 Peter>   release candidate. See
 Peter>   http://lists.busybox.net/pipermail/buildroot/2009-February/025974.html
 Peter>   for more details.

This is still the case. The aim is currently to close the tree for new
features and release 2009.05-rc1 sometime in the weekend 24-25th of
April.

-- 
Bye, Peter Korsgaard
