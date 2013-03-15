From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 15 Mar 2013 09:58:11 +0000 (UTC)
Subject: [Buildroot] [Bug 6122] iconv.h missing for charconv.c build
In-Reply-To: <bug-6122-163@https.bugs.busybox.net/>
References: <bug-6122-163@https.bugs.busybox.net/>
Message-ID: <20130315095811.83E229B0A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6122

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2013-03-15 09:58:53 UTC ---
I don't understand, which package failed to build?

Is it dosfstools? If so, dosfstools correctly has a dependency on WCHAR. I see
'*** dosfstools requires a toolchain with LARGEFILE and WCHAR support ***' in
my menuconfig.

And I don't see any package that depend on it without taking care of the WCHAR
dependency.

Could you provide a few more details? Thanks!

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
