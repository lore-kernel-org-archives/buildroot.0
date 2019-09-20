From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 20 Sep 2019 00:06:41 +0000
Subject: [Buildroot] [Bug 12241] Permission denied while running "make"
In-Reply-To: <bug-12241-163@https.bugs.busybox.net/>
References: <bug-12241-163@https.bugs.busybox.net/>
Message-ID: <bug-12241-163-bmsbPOZRWi@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12241

--- Comment #2 from Cerem Cem ASLAN <ceremcem@ceremcem.net> ---
"touch /tmp/foobar" works correctly:

ceremcem at cca-erik:~$ touch /tmp/foobar
ceremcem at cca-erik:~$ ls -l /tmp/foobar
-rw-r--r-- 1 ceremcem ceremcem 0 Sep 20 03:04 /tmp/foobar


FYI: I've been using this installation for more than 2 years without any issue.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
