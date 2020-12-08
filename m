From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 08 Dec 2020 14:47:04 +0000
Subject: [Buildroot] [Bug 13366] make pkg-stats: unrelated CVEs linked to
 linux package
In-Reply-To: <bug-13366-163@https.bugs.busybox.net/>
References: <bug-13366-163@https.bugs.busybox.net/>
Message-ID: <bug-13366-163-zsjHUOHBmO@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13366

--- Comment #2 from Aleksandr Makarov <seems.deviant@gmail.com> ---
The mentioned patch series seems to help with the CVEs flood for linux package.

However, I find it odd to see in which order the CVEs column gets sorted now: 

- In ascending order: "yellow - orange - green", but i'd expect "orange -
yellow - green"
- In descending order: "green - orange - yellow" instead of "green - yellow -
orange"

(See attached image for illustration)

-- 
You are receiving this mail because:
You are on the CC list for the bug.
