From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 22 Dec 2010 14:54:58 +0000 (UTC)
Subject: [Buildroot] [Bug 2197] classpath should depends on IPv6
In-Reply-To: <bug-2197-163@https.bugs.busybox.net/>
References: <bug-2197-163@https.bugs.busybox.net/>
Message-ID: <20101222145458.5ECDA8E25F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2197

--- Comment #4 from Thomas Rudin <thomas@rudin.li>  ---
Created attachment 2821
  --> https://bugs.busybox.net/attachment.cgi?id=2821
Patch for Classpath Package

After some modifications in the classpath package
it worked for me (i386 uclibc)
see attachment

can you tell me why the package was masked?
i like to fix it, but i can't find any error-reports or comments about it...

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
