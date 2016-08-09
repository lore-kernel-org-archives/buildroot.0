From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 09 Aug 2016 10:27:57 +0000
Subject: [Buildroot] [Bug 9136] make graph-size fails with "ValueError: too
 many values to unpack"
In-Reply-To: <bug-9136-163@https.bugs.busybox.net/>
References: <bug-9136-163@https.bugs.busybox.net/>
Message-ID: <bug-9136-163-k9ewSsi8NW@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9136

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Fixed in
https://git.buildroot.org/buildroot/commit/?id=34b1bdeba40bf303dc8821421745d5b38a729984.
Thanks for reporting the bug! Next time, please send your patches to the
mailing list :)

-- 
You are receiving this mail because:
You are on the CC list for the bug.
