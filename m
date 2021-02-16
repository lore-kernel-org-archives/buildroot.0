From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 16 Feb 2021 21:48:06 +0000
Subject: [Buildroot] [Bug 11706] binman (U-boot tool) cannot find libfdt
 "binman: No module named _libfdt" if python3 selected
In-Reply-To: <bug-11706-163@https.bugs.busybox.net/>
References: <bug-11706-163@https.bugs.busybox.net/>
Message-ID: <bug-11706-163-OdxVbhSjR0@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11706

Thomas Petazzoni <thomas.petazzoni@bootlin.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|ASSIGNED                    |RESOLVED

--- Comment #4 from Thomas Petazzoni <thomas.petazzoni@bootlin.com> ---
I indeed think this issue is resolved now that binman uses python3 in more
recent versions of U-Boot. Also Buildroot has been enhanced to be able to
describe U-Boot configurations that depend on python2 or python3.

Let's assume this is fixed.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
