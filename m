From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 16 Jan 2017 13:00:40 +0000
Subject: [Buildroot] [Bug 9576] External tree with BR 2016.11 does not work
	anymore
In-Reply-To: <bug-9576-163@https.bugs.busybox.net/>
References: <bug-9576-163@https.bugs.busybox.net/>
Message-ID: <bug-9576-163-NPfSNPMmsl@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9576

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #4 from Peter Korsgaard <jacmet@uclibc.org> ---
Fixed in git, thanks:

https://git.buildroot.net/buildroot/commit/?id=05576fca13b129da8c7186ee2307981135d3391f

I will also include it in the upcoming 2016.11.2 bugfix release.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
