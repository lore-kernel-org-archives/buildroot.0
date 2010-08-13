From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 13 Aug 2010 14:25:08 +0000 (UTC)
Subject: [Buildroot] [Bug 2395] libglib2-2.24.1 and libxml2-2.7.7 fails
 build on MIPS because is missing -ldl
In-Reply-To: <bug-2395-163@https.bugs.busybox.net/>
References: <bug-2395-163@https.bugs.busybox.net/>
Message-ID: <20100813142508.BBA6C87458@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2395

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
I'm sorry but with exactly your configuration, I'm able to build both libglib2
and libxml2 properly, without any of the modifications you've done.

Could you please to a complete rebuild from scratch (removing everything !) and
put the build log somewhere ?

Adding -ldl manually to the Makefiles is not a proper fix, the Makefiles are
generated files, and the fact that -ldl is needed or not should be detected by
the ./configure script.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
