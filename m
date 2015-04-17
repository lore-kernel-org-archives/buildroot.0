From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 17 Apr 2015 13:02:58 +0000 (UTC)
Subject: [Buildroot] [Bug 8011] When building only busybox and strace,
 strace fails on not finding bluetooth/bluetooth.h
In-Reply-To: <bug-8011-163@https.bugs.busybox.net/>
References: <bug-8011-163@https.bugs.busybox.net/>
Message-ID: <20150417130258.21B33818E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8011

Jaap Crezee <jaap@jcz.nl> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |INVALID

--- Comment #12 from Jaap Crezee <jaap@jcz.nl> 2015-04-17 13:02:57 UTC ---
I think it was my badness after all. I cloned the buildroot git archive and put
several branches in it from which I develop my various images. Sometimes I git
checkout <other_branch> and forget to do a make clean.
I changed my method of working to cloning the archive in multiple directories
en never do git checkout <other_branch> in those directories.
It seems to work as expected now.

Closing the issue.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
