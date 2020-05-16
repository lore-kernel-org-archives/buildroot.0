From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 16 May 2020 14:20:25 +0000
Subject: [Buildroot] [Bug 12826] nodejs-12.16.1: error: 'uv_sleep' was not
 declared in this scope
In-Reply-To: <bug-12826-163@https.bugs.busybox.net/>
References: <bug-12826-163@https.bugs.busybox.net/>
Message-ID: <bug-12826-163-sc7w3wKmjd@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12826

--- Comment #4 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
So, commit 7d9ed0a19d8e88b56b389187c38b44563e33e5ab is not the culprit, I'm not
sure how it can have fixed the problem for you.

Are you sure this issue happens from a clean build ?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
