From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 04 Aug 2018 17:04:08 +0000
Subject: [Buildroot] [Bug 11096] Upgrade from glibc 2.26 to 2.27 broke some
 locales (ru_RU in particular)
In-Reply-To: <bug-11096-163@https.bugs.busybox.net/>
References: <bug-11096-163@https.bugs.busybox.net/>
Message-ID: <bug-11096-163-0qjtUFT4sY@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11096

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
An initial proposal has been made to resolve this issue:
https://patchwork.ozlabs.org/patch/950717/. While the patch is not perfect, it
shouldn't be too difficult to improve to make it acceptable.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
