From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 14 Dec 2010 11:05:06 +0000 (UTC)
Subject: [Buildroot] [Bug 1651] Build fail caused by ccache in
	module-init-tools
In-Reply-To: <bug-1651-163@https.bugs.busybox.net/>
References: <bug-1651-163@https.bugs.busybox.net/>
Message-ID: <20101214110506.3C9DD8E2F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1651

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #10 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
The issue was in fact that glibc-static was missing on the user host system. We
have added a FAQ entry in Buildroot documentation to document this. See
http://git.buildroot.net/buildroot/commit/?id=706683b8b912aa3304d71652d7a4a74d8b74f58e

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
