From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 31 Oct 2017 20:58:32 +0000
Subject: [Buildroot] [Bug 10356] nfs-utils missing header
In-Reply-To: <bug-10356-163@https.bugs.busybox.net/>
References: <bug-10356-163@https.bugs.busybox.net/>
Message-ID: <bug-10356-163-vrjmoqxxty@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10356

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Fixed by
https://git.buildroot.org/buildroot/commit/package/nfs-utils?id=854d61f7aabac5f9f2f9612bd88266d5f44c4a5a.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
