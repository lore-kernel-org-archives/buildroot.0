From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 21 Oct 2015 12:56:58 +0000 (UTC)
Subject: [Buildroot] [Bug 8416] cups depends on BR2_DEPRECATED_SINCE_2015_05
In-Reply-To: <bug-8416-163@https.bugs.busybox.net/>
References: <bug-8416-163@https.bugs.busybox.net/>
Message-ID: <20151021125658.0C8DF7FFAC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8416

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|[buildroot 2015.8] cups     |cups depends on
                   |depends on                  |BR2_DEPRECATED_SINCE_2015_0
                   |BR2_DEPRECATED_SINCE_2015_0 |5
                   |5                           |

--- Comment #5 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2015-10-21 12:56:57 UTC ---
It is worth mentioning that there is a set of patches updating and
undeprecating CUPS. See:

http://patchwork.ozlabs.org/patch/518817/
http://patchwork.ozlabs.org/patch/518818/
http://patchwork.ozlabs.org/patch/518820/
http://patchwork.ozlabs.org/patch/518821/
http://patchwork.ozlabs.org/patch/518822/

Could you test them, and see if they work for you? Thanks!

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
