From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 15 Jul 2017 09:33:58 +0000
Subject: [Buildroot] [Bug 9341] avahi-utils does not compile with uClibc +
	libglib2
In-Reply-To: <bug-9341-163@https.bugs.busybox.net/>
References: <bug-9341-163@https.bugs.busybox.net/>
Message-ID: <bug-9341-163-r57C0smN6y@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9341

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
I believe this issue has been resolved by the recent gettext reworked, merged
in master since early July. Now, all 3 C libraries have a gettext
implementation built-in, which allows to avoid a lot of those issues.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
