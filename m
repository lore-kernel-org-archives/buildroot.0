From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 28 Feb 2017 22:10:55 +0000
Subject: [Buildroot] [Bug 9456] mkusers script bash errors
In-Reply-To: <bug-9456-163@https.bugs.busybox.net/>
References: <bug-9456-163@https.bugs.busybox.net/>
Message-ID: <bug-9456-163-M1Cqy4mNHw@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9456

--- Comment #12 from Yann E. MORIN <yann.morin.1998@free.fr> ---
(In reply to paulstewartis at gmail.com from comment #11)

OK, bash is not too old ( I have 4.3.46).

Wild guess: your users table file does not have CR-LF endings, does it?

I have absolutely no clue what's going on... :-/

-- 
You are receiving this mail because:
You are on the CC list for the bug.
