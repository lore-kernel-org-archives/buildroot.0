From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 10 May 2017 21:39:16 +0000
Subject: [Buildroot] [Bug 9796] source-check broken for Git downloads
In-Reply-To: <bug-9796-163@https.bugs.busybox.net/>
References: <bug-9796-163@https.bugs.busybox.net/>
Message-ID: <bug-9796-163-gyXf4HMcWE@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9796

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED

--- Comment #4 from Yann E. MORIN <yann.morin.1998@free.fr> ---
The underlying reason s that foo-source-check has no stamp file
associated to it, and eventually, $(PKG) is empty.

I'll fix soonish...

-- 
You are receiving this mail because:
You are on the CC list for the bug.
