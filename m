From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 20 Dec 2019 15:14:49 +0000
Subject: [Buildroot] [Bug 12426] NodeJS slow startup performance (~30s)
In-Reply-To: <bug-12426-163@https.bugs.busybox.net/>
References: <bug-12426-163@https.bugs.busybox.net/>
Message-ID: <bug-12426-163-kT0IjzTjds@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12426

--- Comment #2 from Eric Higgins <erichiggins@gmail.com> ---
Yes, I'm using BR2_OPTIMIZE_S=y but I can try BR2_OPTIMIZE_2=y and report back.

I emailed the listed developers for package/nodejs and Daniel emailed back with
a few suggestions specific to that package's build flags, though they were not
successful for me and it started to get a bit more complex than I could commit
to (hence this ticket).

-- 
You are receiving this mail because:
You are on the CC list for the bug.
