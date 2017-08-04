From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 04 Aug 2017 07:03:55 +0000
Subject: [Buildroot] [Bug 10151] toolchain eclipse register : fails with a
 custom BR2_HOST_DIR
In-Reply-To: <bug-10151-163@https.bugs.busybox.net/>
References: <bug-10151-163@https.bugs.busybox.net/>
Message-ID: <bug-10151-163-I9PqJtKWvm@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10151

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
I'm not really happy to add this host symlink just for the sake of making the
eclipse-register-toolchain script work. Instead, we should pass $(HOST_DIR) as
argument to eclipse-register-toolchain.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
