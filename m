From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 11 Dec 2013 17:15:56 +0000 (UTC)
Subject: [Buildroot] [Bug 5366] Login doesn't work with util-linux versions
 of login/agetty
In-Reply-To: <bug-5366-163@https.bugs.busybox.net/>
References: <bug-5366-163@https.bugs.busybox.net/>
Message-ID: <20131211171556.A3F1B9BFCA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5366

Gustavo Zacarias <gustavo@zacarias.com.ar> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED
         AssignedTo|unassigned at buildroot.uclibc |gustavo at zacarias.com.ar
                   |.org                        |

--- Comment #13 from Gustavo Zacarias <gustavo@zacarias.com.ar> 2013-12-11 17:15:55 UTC ---
This should be fixed by commits 72b3c1db513a6235fd5e5f00fb6c15071ffc6015,
33e3245e047858cd89223cf5b4afbf4cb32318b0 and
1a0b170a55126115d883f6cde9871e06a80f9cc2 (maybe i'm missing some other) for the
2014.02 release.
If you're still seeing issues with this feel free to reopen this bug with the
details (and using a latest git version). Thanks.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
