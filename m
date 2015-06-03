From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  3 Jun 2015 01:28:27 +0000 (UTC)
Subject: [Buildroot] [Bug 4291] Segmentation fault with all binaries that
 use threads when compiled with gcc 4.6
In-Reply-To: <bug-4291-163@https.bugs.busybox.net/>
References: <bug-4291-163@https.bugs.busybox.net/>
Message-ID: <20150603012827.7921E8177E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4291

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WONTFIX

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2015-06-03 01:28:27 UTC ---
This bug is very old (almost 4 years), we don't support uClibc 0.9.32 or gcc
4.6 anymore. So I'm marking it as "WONTFIX". Please reopen if you're still
seeing the problem with a recent Buildroot.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
