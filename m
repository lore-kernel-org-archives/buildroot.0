From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 03 Feb 2018 13:56:46 +0000
Subject: [Buildroot] [Bug 10141] Squashfs extended attribute failures
In-Reply-To: <bug-10141-163@https.bugs.busybox.net/>
References: <bug-10141-163@https.bugs.busybox.net/>
Message-ID: <bug-10141-163-ROn41y2U7a@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10141

--- Comment #10 from Yann E. MORIN <yann.morin.1998@free.fr> ---
(In reply to Bob from comment #9)

What version of Buildroot are you using? This is supposedly fixed with
commit eff989bab (package/fakeroot: fix highly parallel uses) which
first shipped in Buildroot 2017.08, and was back-ported over to 2017.02.6
in commit ac847623f5.

Can you check you heither one of those changes in your tree?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
