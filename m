From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 12 Apr 2015 12:06:47 +0000 (UTC)
Subject: [Buildroot] [Bug 8011] When building only busybox and strace,
 strace fails on not finding bluetooth/bluetooth.h
In-Reply-To: <bug-8011-163@https.bugs.busybox.net/>
References: <bug-8011-163@https.bugs.busybox.net/>
Message-ID: <20150412120647.3888E7FC87@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8011

--- Comment #8 from Jaap Crezee <jaap@jcz.nl> 2015-04-12 12:06:46 UTC ---
Okay, I checked the build output:

<snip>
checking bluetooth/bluetooth.h usability... yes
checking bluetooth/bluetooth.h presence... no
configure: WARNING: bluetooth/bluetooth.h: accepted by the compiler, rejected
by the preprocessor!
configure: WARNING: bluetooth/bluetooth.h: proceeding with the compiler's
result
checking for bluetooth/bluetooth.h... yes
</snip>

Any clue if I should look into the toolchain?

I might also try the buildroot toolchain generator once more later today. I
could also build that once, store it in /opt/cross/ .. and just use that from
buildroot, just like my current toolchain.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
