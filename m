From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat,  9 Aug 2014 15:49:28 +0000 (UTC)
Subject: [Buildroot] [Bug 7250] Cannot build with -std=c++11
In-Reply-To: <bug-7250-163@https.bugs.busybox.net/>
References: <bug-7250-163@https.bugs.busybox.net/>
Message-ID: <20140809154928.7F8699D3FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7250

--- Comment #9 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2014-08-09 15:49:28 UTC ---
Not yet, because the same patch needs to be made for gcc 4.7, 4.8, 4.9 and the
special ARC version. I've already done that, and started building toolchains
with those various gcc versions. But it takes some time, and I was busy with
the maintenance. Now that Peter has taken over the maintenance, I'll focus on
bug fixes, and I know I have this bug, and the one related to musl patches to
fix. Those are my top priorities issues to fix for 2014.08.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
