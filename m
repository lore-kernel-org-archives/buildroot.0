From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 06 Sep 2017 13:33:04 +0200
Subject: [Buildroot] [git commit] package/transmission: fix gtk support
In-Reply-To: <20170901231151.D50C2818D4@busybox.osuosl.org> (Peter Korsgaard's
 message of "Fri, 1 Sep 2017 23:58:40 +0200")
References: <20170901231151.D50C2818D4@busybox.osuosl.org>
Message-ID: <87tw0gdpu7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=e67fbcfa94e58a4d04e081be5e318953233492c8
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Gtk support is controlled by ARG_WITH since
 > https://github.com/transmission/transmission/commit/2ccc2bbbfe2e4a26dfeaa13b56c412ea0af4ebe4

 > Fixes a build error if libgtk2/3 was built before transmission:
 > http://autobuild.buildroot.net/results/6b6/6b6ce352a9edfe3aaba82be143092a878e7715ed/

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
