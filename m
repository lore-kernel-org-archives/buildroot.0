From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 29 Jul 2020 22:00:26 +0000
Subject: [Buildroot] [Bug 13121] wpa_supplicant fails to build without
 libopenssl enabled
In-Reply-To: <bug-13121-163@https.bugs.busybox.net/>
References: <bug-13121-163@https.bugs.busybox.net/>
Message-ID: <bug-13121-163-pY5fjFhWIC@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13121

--- Comment #1 from Matthew Starr <mstarr@hedonline.com> ---
Here is the buildroot configuration file that causes the wpa_supplication
package to fail to build:

https://pastebin.com/42J2BuLW

-- 
You are receiving this mail because:
You are on the CC list for the bug.
