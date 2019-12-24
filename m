From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 24 Dec 2019 21:32:53 +0000
Subject: [Buildroot] [Bug 12426] NodeJS slow startup performance (~30s)
In-Reply-To: <bug-12426-163@https.bugs.busybox.net/>
References: <bug-12426-163@https.bugs.busybox.net/>
Message-ID: <bug-12426-163-5Q7GANxYkj@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12426

--- Comment #9 from Eric Higgins <erichiggins@gmail.com> ---
Looks like ./configure is called a few times within the Makefile


https://github.com/nodejs/node/blob/v12.14.0/Makefile

-- 
You are receiving this mail because:
You are on the CC list for the bug.
