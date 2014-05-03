From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat,  3 May 2014 21:05:40 +0000 (UTC)
Subject: [Buildroot] [Bug 6956] Packaging libsoxr
In-Reply-To: <bug-6956-163@https.bugs.busybox.net/>
References: <bug-6956-163@https.bugs.busybox.net/>
Message-ID: <20140503210540.B3A4B9CAD8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6956

Gustavo Zacarias <gustavo@zacarias.com.ar> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #6 from Gustavo Zacarias <gustavo@zacarias.com.ar> 2014-05-03 21:05:39 UTC ---
libsoxr added in commit 705662b41d59558ad6ca11362c9611cf13f1d6fd for the
upcoming 2014.05 release.
But please note you're probably talking of mpd 0.18.6 (and not 18.6), and
anyway the whole 0.18.x branch lacks libsoxr support, that'll probably be in
0.19.x or whatever the next major release is called (it's in mpd git master for
now).
Thanks.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
