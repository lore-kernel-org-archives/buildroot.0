From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  2 Apr 2010 14:03:45 +0000 (UTC)
Subject: [Buildroot] [Bug 1453] OpenSSL0.9.8n fails to compile
In-Reply-To: <bug-1453-163@https.bugs.busybox.net/>
References: <bug-1453-163@https.bugs.busybox.net/>
Message-ID: <20100402140345.A70BC7F8F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1453





--- Comment #4 from Nazarenko Nikita <nnazarenko@radiofid.ru>  2010-04-02 14:03:45 UTC ---
(In reply to comment #3)
> Ok, I'll check patch applying on my system. Thanks.
> 
did you try to make clean and build again? it seems like I have problem with
makefiles. Target .stamp_patched only touch .stamp_patched and nothing more


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
