From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 12 Nov 2018 17:39:32 +0000
Subject: [Buildroot] [Bug 11216] Capabilities not applied to filesystem
In-Reply-To: <bug-11216-163@https.bugs.busybox.net/>
References: <bug-11216-163@https.bugs.busybox.net/>
Message-ID: <bug-11216-163-dWoPP3qXVI@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11216

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|Extended attributes not     |Capabilities not applied to
                   |applied to filesystem       |filesystem

--- Comment #3 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Ricardo, All,

Also, I've edited the title of this BZ, because it really relates
to capabilities. Our makedevs syntax only allows for specifying
capabilities, not arbitrary extended attributes.

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
