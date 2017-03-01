From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 01 Mar 2017 17:30:07 +0000
Subject: [Buildroot] [Bug 9456] mkusers script bash errors
In-Reply-To: <bug-9456-163@https.bugs.busybox.net/>
References: <bug-9456-163@https.bugs.busybox.net/>
Message-ID: <bug-9456-163-PPfebUmnA5@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9456

--- Comment #17 from Yann E. MORIN <yann.morin.1998@free.fr> ---
(In reply to Paul Stewart from comment #15)

So I downloaded that file and uses it:

  - as-is, and it creates the three users: dummy, paul and git;
  - without the dummy user, and it creates paul and git.

I'll try to instrument the script and attach a patch so that you can report the
output. Give me a moment...

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
