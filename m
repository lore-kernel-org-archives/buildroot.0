From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 12 Jul 2019 18:52:16 +0000
Subject: [Buildroot] [Bug 12031] Build of cups-filters fails while linking,
 apparently due to missing libiconv
In-Reply-To: <bug-12031-163@https.bugs.busybox.net/>
References: <bug-12031-163@https.bugs.busybox.net/>
Message-ID: <bug-12031-163-Kk17lFPiXS@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12031

--- Comment #1 from jakobcornell at gmail.com ---
I've enabled Iconv in the uClibc config as well and done a clean build. The
same error appears.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
