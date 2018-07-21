From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 21 Jul 2018 06:35:21 +0000
Subject: [Buildroot] [Bug 11166] Erlang bad argument on valid uint64 when
 crosscompiled on 64-bit host
In-Reply-To: <bug-11166-163@https.bugs.busybox.net/>
References: <bug-11166-163@https.bugs.busybox.net/>
Message-ID: <bug-11166-163-CS8VBKRYa8@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11166

--- Comment #1 from Frank Hunleth <fhunleth@troodon-software.com> ---
Is it possible to reproduce this with a small Erlang application? Or with any
other code that calls a NIF that runs enif_get_uint64()? This sounds more like
an issue with how bitcask was cross-compiled. I assume bitcask was
cross-compiled outside of Buildroot, right?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
