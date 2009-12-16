From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Wed, 16 Dec 2009 16:53:24 +0000 (UTC)
Subject: [Buildroot] OT: git workflow question
Message-ID: <hgb3a3$88l$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I don't seem to "get" git when it comes to working with
buildroot.

 1) I cloned the repository about two weeks ago

 2) I made a bunch of small edits to docs/buildroot.html and
    commited them locally.

 3) I submitted the changes using git format-patch

 4) The patches were merged to the "master" repository

 5) Then when I did a "git pull" to update my repository, it
    failed because of conflicts in docs/buildroot.html

Since I had only changed the one file (and those changes had
been merged into the master repository) I didn't bother trying
to resolve the conflict -- I just blew away my repository and
did a 'clone'.

Here's my question: why was there a conflict?

Is this how git is supposed to work?

-- 
Grant Edwards                   grante             Yow! I'm ZIPPY the PINHEAD
                                  at               and I'm totally committed
                               visi.com            to the festive mode.
