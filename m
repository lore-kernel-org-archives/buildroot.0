From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 14 Nov 2013 16:22:41 +0000 (UTC)
Subject: [Buildroot] [Bug 6692] GNU nano fails to compile for x86_64
In-Reply-To: <bug-6692-163@https.bugs.busybox.net/>
References: <bug-6692-163@https.bugs.busybox.net/>
Message-ID: <20131114162241.E165D9BCBB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6692

--- Comment #2 from Cassiano Martin <cassiano@idbinfo.com.br> 2013-11-14 16:22:41 UTC ---
Confirmed. I enabled file package and now nano compiles just fine. Somehow
libmagic from my distribution is leaking into build, as you said.

And this is not the only one, libncursesw also leaked into the build, resulting
into nano binary linked against it.

Thanks

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
