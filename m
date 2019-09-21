From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 21 Sep 2019 17:09:31 +0000
Subject: [Buildroot] [Bug 12031] Build of cups-filters fails while linking,
 apparently due to missing libiconv
In-Reply-To: <bug-12031-163@https.bugs.busybox.net/>
References: <bug-12031-163@https.bugs.busybox.net/>
Message-ID: <bug-12031-163-hvJslazN7W@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12031

Carlos Santos <unixmania@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|REOPENED                    |RESOLVED

--- Comment #10 from Carlos Santos <unixmania@gmail.com> ---
Fixed by https://patchwork.ozlabs.org/patch/1164349/

-- 
You are receiving this mail because:
You are on the CC list for the bug.
