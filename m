From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 05 Nov 2020 19:05:31 +0000
Subject: [Buildroot] [Bug 13296] host-libcap failed to build
In-Reply-To: <bug-13296-163@https.bugs.busybox.net/>
References: <bug-13296-163@https.bugs.busybox.net/>
Message-ID: <bug-13296-163-TqLGz1l3nD@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13296

--- Comment #5 from Heiko Thiery <heiko.thiery@gmail.com> ---
Your're right. That is not needed anymore. It was just a quick shot to get a
feetback. I added an updated version of the patch that removes the DYNAMIC
arguments.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
