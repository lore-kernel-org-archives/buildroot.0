From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 02 Nov 2018 17:15:34 +0000
Subject: [Buildroot] [Bug 11476] stdio2.h error invalid use of
 __builtin_va_arg_pack
In-Reply-To: <bug-11476-163@https.bugs.busybox.net/>
References: <bug-11476-163@https.bugs.busybox.net/>
Message-ID: <bug-11476-163-omHAVvQCdh@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11476

--- Comment #4 from romain.naour at gmail.com ---
Hi,

I'm able to reproduce this issue with gcc5 but not with gcc6.
Any reason to keep this specific version ? 

gcc5 is not maintained by upstream and we already use the latest version, I'm
not sure it would be easy/safe to backport an upstream patch.

Best regards,
Romain

-- 
You are receiving this mail because:
You are on the CC list for the bug.
