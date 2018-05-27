From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 27 May 2018 17:37:30 +0000
Subject: [Buildroot] [Bug 11046] Git package binaries are ~180MB (compared
 to ~20MB in stable branches).
In-Reply-To: <bug-11046-163@https.bugs.busybox.net/>
References: <bug-11046-163@https.bugs.busybox.net/>
Message-ID: <bug-11046-163-eSUtbOfM3D@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11046

--- Comment #2 from Paul Stewart <paulstewartis@gmail.com> ---
(In reply to Arnout Vandecappelle from comment #1)

The post scripts only run if they are called out in the config, right?  Either
way, none of my scripts do anything with git.  I can definitely reproduce with
the attached, minimal, config.

The binaries are normal in target/usr/libexec/git-core. So I think you're on
the right track.

What's the best way for me to determine: "if the copies are made during the
install of git itself, or during the target-finalize step, or maybe even during
rootfs generation"?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
