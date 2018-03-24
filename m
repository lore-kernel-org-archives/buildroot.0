From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 24 Mar 2018 20:49:01 +0000
Subject: [Buildroot] [Bug 10766] upmpdcli: Segmentation fault
In-Reply-To: <bug-10766-163@https.bugs.busybox.net/>
References: <bug-10766-163@https.bugs.busybox.net/>
Message-ID: <bug-10766-163-EeikfAxc75@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10766

--- Comment #4 from Peter Korsgaard <jacmet@uclibc.org> ---
FYI, I've backported the libupnp bump to the 2018.02.x branch so it will be
included in the next bugfix release:

https://git.busybox.net/buildroot/commit/?h=2018.02.x&id=70c77467b9fe3033ee3670763594a4d50237d6d5

-- 
You are receiving this mail because:
You are on the CC list for the bug.
