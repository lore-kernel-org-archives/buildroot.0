From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  4 Aug 2014 07:01:45 +0000 (UTC)
Subject: [Buildroot] [Bug 7286] systemd 215 doesn't build
In-Reply-To: <bug-7286-163@https.bugs.busybox.net/>
References: <bug-7286-163@https.bugs.busybox.net/>
Message-ID: <20140804070145.E8C8E9D3A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7286

--- Comment #6 from philn at igalia.com 2014-08-04 07:01:44 UTC ---
So what would be the approach to fix this issue then? Ensuring the CPPFLAGS and
CFLAGS don't contain these options when building systemd?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
