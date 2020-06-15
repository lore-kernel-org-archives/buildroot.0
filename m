From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 15 Jun 2020 20:08:35 +0000
Subject: [Buildroot] [Bug 13001] openjdk-bin replaces libfreetype.so from
 host-freetype
In-Reply-To: <bug-13001-163@https.bugs.busybox.net/>
References: <bug-13001-163@https.bugs.busybox.net/>
Message-ID: <bug-13001-163-IGXur1gK9Q@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13001

--- Comment #5 from Jared Bents <jared.bents@rockwellcollins.com> ---
Yann,

I'll send it to the mailing list once I finish testing. It looks like some of
the libraries in the v2 patch will have to stay as the included binaries
instead of building from source because they either cause an issue with openjdk
or with other packages (for example, host-libzip causes host-zip to fail to
build).

I'll include everything in the description once finished.

Thank you,
Jared

-- 
You are receiving this mail because:
You are on the CC list for the bug.
