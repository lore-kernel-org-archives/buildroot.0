From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 11 Nov 2015 15:26:58 +0000 (UTC)
Subject: [Buildroot] [Bug 8456] Building host-pkgconf on Fedora 23 fails due
 to incorrect build dependencies
In-Reply-To: <bug-8456-163@https.bugs.busybox.net/>
References: <bug-8456-163@https.bugs.busybox.net/>
Message-ID: <20151111152658.2C7E1804FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8456

--- Comment #3 from Dr I J Ormshaw <ian_ormshaw@waters.com> 2015-11-11 15:26:57 UTC ---
Created attachment 6221
  --> https://bugs.busybox.net/attachment.cgi?id=6221
Add host coreutils and add some host build dependancies

I'm not claiming to have added all of the required dependencies. but

A) Buildroot now builds for me on Fedora 23
B) This makes things no worse
C) pkgconfig and anything dependent on it now has correct dependencies and uses
   compatible ls and libcap

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
