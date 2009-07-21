From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 21 Jul 2009 10:44:40 +0000 (UTC)
Subject: [Buildroot] [Bug 473] memstat_0.5.tar.gz has install with -D and
 that fails "make" (last buildroot git)
In-Reply-To: <bug-473-163@https.bugs.busybox.net/>
References: <bug-473-163@https.bugs.busybox.net/>
Message-ID: <20090721104440.DEC0D77806@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=473





--- Comment #8 from Etienne Lorrain <etienne_lorrain@yahoo.fr>  2009-07-21 10:44:40 UTC ---
Note that the install man page seems to imply that install can be used with a
target directory only if there is multiple input files:
NAME
       ginstall - copy files and set attributes

SYNOPSIS
       install [OPTION]... SOURCE DEST           (1st format)
       install [OPTION]... SOURCE... DIRECTORY   (2nd format)
       install -d [OPTION]... DIRECTORY...       (3rd format)

DESCRIPTION
       In the first two formats, copy SOURCE to DEST or multiple SOURCE(s) to
       the  existing  DIRECTORY,   while   setting   permission   modes   and
       owner/group.   In the third format, create all components of the given
       DIRECTORY(ies).


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
