From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 06 Sep 2017 13:33:13 +0200
Subject: [Buildroot] [git commit] transmission: gtk option needs libgtk3
In-Reply-To: <20170901231151.E1304804F9@busybox.osuosl.org> (Peter Korsgaard's
 message of "Sat, 2 Sep 2017 00:37:48 +0200")
References: <20170901231151.E1304804F9@busybox.osuosl.org>
Message-ID: <87pob4dpty.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=a2935ee28886b5198093c824c4ee4892d02d10c6
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Fixes the following configure issue:

 > checking for GTK... no
 > configure: error: Package requirements (gtk+-3.0 >= 3.4.0
 >                               glib-2.0 >= 2.32.0
 >                               gio-2.0 >= 2.26.0,
 >                               gmodule-2.0 >= 2.32.0
 >                               gthread-2.0 >= 2.32.0) were not met:

 > libgtk2 support was dropped in commit cdd71c642724 ((trunk gtk) #4970 remove
 > deprecated GTK+ API calls, raise GTK+ dependency to 3.2) which was part of
 > transmission-2.61.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
