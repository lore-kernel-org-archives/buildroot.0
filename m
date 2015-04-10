From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 10 Apr 2015 15:18:22 +0000 (UTC)
Subject: [Buildroot] [Bug 7478] Multiple chosen python modules are not built
 due to missing header files in include path
In-Reply-To: <bug-7478-163@https.bugs.busybox.net/>
References: <bug-7478-163@https.bugs.busybox.net/>
Message-ID: <20150410151822.D6681818D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7478

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WORKSFORME

--- Comment #13 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2015-04-10 15:18:22 UTC ---
I tried again today to do a build with an internal toolchain, python and sqlite
enabled, and it works fine, and I can import the sqlite3 python module on the
target successfully:

Welcome to Buildroot
buildroot login: root
# python -c "import sqlite3"
# 

So, I'm marking this bug as "works for me", since apparently neither Thomas DS
nor I have been able to reproduce it so far.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
