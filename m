From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 30 Dec 2016 21:42:43 +0000
Subject: [Buildroot] [Bug 9526] Embedded NPM fails to start with "no such
 file or directory" error
In-Reply-To: <bug-9526-163@https.bugs.busybox.net/>
References: <bug-9526-163@https.bugs.busybox.net/>
Message-ID: <bug-9526-163-OjvmweDkmc@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9526

--- Comment #17 from Peter Korsgaard <jacmet@uclibc.org> ---
(In reply to bilge from comment #16)

Sorry, I still don't understand you. The Buildroot configuration is about what
gets built FOR THE TARGET, not what is available on the build machine (except
for host packages, but that is not applicable for busybox).

The build machine needs basic UNIX utilities to be able to build the packages
(most, but not all get verified by Buildroot in support/dependencies.sh).

Can you explain more about your setup?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
