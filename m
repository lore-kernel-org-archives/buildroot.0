From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 28 Nov 2019 19:07:36 +0000
Subject: [Buildroot] [Bug 12286] Can't import gobject in python 3.8
In-Reply-To: <bug-12286-163@https.bugs.busybox.net/>
References: <bug-12286-163@https.bugs.busybox.net/>
Message-ID: <bug-12286-163-jol9fBu8wQ@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12286

--- Comment #3 from info at hifiberry.com ---
As Python2 support ends in less than 2 months, just disabling it on Python3
won't really help as there should be no new software anymore that still uses
Python2.
What's the state of the introspection code?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
