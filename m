From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 13 Nov 2018 07:18:58 +0000
Subject: [Buildroot] [Bug 11216] Capabilities not applied to filesystem
In-Reply-To: <bug-11216-163@https.bugs.busybox.net/>
References: <bug-11216-163@https.bugs.busybox.net/>
Message-ID: <bug-11216-163-M15UQX1HnW@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11216

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|---                         |FIXED

--- Comment #4 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Ricardo, All,

Fixed by:
   
https://git.buildroot.org/buildroot/commit?id=409d4c3fe9949f01b009712a1a731baf597e0f8d

Thanks for the very detailed report! :-)

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
