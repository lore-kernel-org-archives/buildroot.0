From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 03 Aug 2017 21:29:03 +0000
Subject: [Buildroot] [Bug 10151] toolchain eclipse register : fails with a
 custom BR2_HOST_DIR
In-Reply-To: <bug-10151-163@https.bugs.busybox.net/>
References: <bug-10151-163@https.bugs.busybox.net/>
Message-ID: <bug-10151-163-qI70hdMSUg@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10151

--- Comment #1 from Arnout Vandecappelle <arnout@mind.be> ---
Indeed, the eclipse-register-toolchain script doesn't seem to support a
non-default BR2_HOST_DIR.

A simple solution would be to symlink host to BR2_HOST_DIR if it's not the
default. Any objections to that?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
