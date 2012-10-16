From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 16 Oct 2012 02:16:01 +0000 (UTC)
Subject: [Buildroot] [Bug 5234] kexec fails to build
In-Reply-To: <bug-5234-163@https.bugs.busybox.net/>
References: <bug-5234-163@https.bugs.busybox.net/>
Message-ID: <20121016021601.91A8299884@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5234

--- Comment #1 from Gustavo Zacarias <gustavo@zacarias.com.ar> 2012-10-16 02:16:00 UTC ---
Did you try with a newer version of Buildroot which uses kexec 2.0.3?
If it still fails, can you attach a sample .config since i can't reproduce?
A simple solution would be to pass the BUILD_CC and BUILD_CFLAGS variables to
configure, no kexec-tools patching needed and it's there to be used.
Thanks.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
