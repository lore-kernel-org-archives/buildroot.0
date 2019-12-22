From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 22 Dec 2019 15:49:41 +0000
Subject: [Buildroot] [Bug 12426] NodeJS slow startup performance (~30s)
In-Reply-To: <bug-12426-163@https.bugs.busybox.net/>
References: <bug-12426-163@https.bugs.busybox.net/>
Message-ID: <bug-12426-163-47ZwHWq7E1@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12426

--- Comment #4 from Eric Higgins <erichiggins@gmail.com> ---
Using BR2_OPTIMIZE_2=y didn't make any discernible difference.

time node --help
...
real    0m 27.46s
user    0m 22.92s
sys     0m 1.90s

-- 
You are receiving this mail because:
You are on the CC list for the bug.
