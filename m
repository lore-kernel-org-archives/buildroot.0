From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 30 Jul 2015 10:11:05 +0000 (UTC)
Subject: [Buildroot] [Bug 8036] alsa-lib headers problem that prevents to
 compile alsa dependent projects
In-Reply-To: <bug-8036-163@https.bugs.busybox.net/>
References: <bug-8036-163@https.bugs.busybox.net/>
Message-ID: <20150730101105.3909881E95@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8036

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WORKSFORME

--- Comment #14 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2015-07-30 10:11:05 UTC ---
Problem no longer reproducible. Might have been caused by a lack of a full
rebuild (i.e "make clean all").

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
