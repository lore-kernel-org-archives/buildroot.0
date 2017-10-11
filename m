From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 11 Oct 2017 14:44:28 +0000
Subject: [Buildroot] [Bug 10391] WiringPi retrieves wrong (old) version
In-Reply-To: <bug-10391-163@https.bugs.busybox.net/>
References: <bug-10391-163@https.bugs.busybox.net/>
Message-ID: <bug-10391-163-AUwBHng6pW@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10391

--- Comment #7 from Yann E. MORIN <yann.morin.1998@free.fr> ---
> I don't know the exact version which started accepting a tag with -b.

So it was 1.8.0, released 2012-10-21, which added support for tags for
git clone -b. So, git-1.7.x and before will not work with our current
wrapper.

Ubuntu 12.04 uses git-1.7.9.5. 12.04 was an LTS which supports ended
last April, but there are older releases of other distros still supported
today (e.g. RHEL), and those probably use even older git versions...

-- 
You are receiving this mail because:
You are on the CC list for the bug.
