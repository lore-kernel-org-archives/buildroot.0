From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 May 2016 15:21:19 +0200
Subject: [Buildroot] [PATCH v2] package/jack2: fix build WRT backtrace
	support
In-Reply-To: <1463458206-3829-1-git-send-email-s.martin49@gmail.com> (Samuel
 Martin's message of "Tue, 17 May 2016 06:10:06 +0200")
References: <1463458206-3829-1-git-send-email-s.martin49@gmail.com>
Message-ID: <871t50ddm8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 > This change adds a patch checking for the presence of execinfo.h header
 > and enabling the backtrace support depending on the check result.

 > Fixes:
 >   http://autobuild.buildroot.org/results/415/415e2100dc59d35e58646c07f7cdccabecdda966/
 >   http://autobuild.buildroot.org/results/43c/43ca1b103434ae582fdf93cb5912b311960f303b/
 >   http://autobuild.buildroot.org/results/391/391e71a988250ea66ec4dbee6f60fdce9eaf2766/
 >   ...

 > Adapted from the PR:
 >   https://github.com/jackaudio/jack2/pull/206

 > Signed-off-by: Samuel Martin <s.martin49@gmail.com>

 > ---
 > changes v1->v2:
 > - update commit log + add SoB line of the patch (Baruch)

Committed, thanks.

-- 
Bye, Peter Korsgaard
