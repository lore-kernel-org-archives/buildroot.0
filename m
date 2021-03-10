From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 10 Mar 2021 19:50:37 +0000
Subject: [Buildroot] [Bug 13576] Issues compiling buildroot for 5x86
In-Reply-To: <bug-13576-163@https.bugs.busybox.net/>
References: <bug-13576-163@https.bugs.busybox.net/>
Message-ID: <bug-13576-163-Vu9XrHBq8S@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13576

--- Comment #10 from ingineru_de_sistem at yahoo.com ---
(In reply to Peter Korsgaard from comment #5)

For the .config file, see previous attachment.

The issues with mariadb is that parl-dbd-mysql and rsyslog have trouble finding
mysql.h. Modifying Makefile and re-running make fixes that temporarily, so they
can finally compile.
Have NOT tested with Oracle's flavor.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
