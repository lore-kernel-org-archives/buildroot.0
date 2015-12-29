From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 29 Dec 2015 17:27:21 +0000
Subject: [Buildroot] [Bug 7886] gettext: link failure with locally-installed
	libxml2
In-Reply-To: <bug-7886-163@https.bugs.busybox.net/>
References: <bug-7886-163@https.bugs.busybox.net/>
Message-ID: <bug-7886-163-ujhc5j0mVf@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7886

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|ASSIGNED                    |RESOLVED

--- Comment #4 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Fixed with:
https://git.buildroot.org/buildroot/commit/?id=a7fe2ce6f499830f590177bf9a76cf144fd198dc

Thanks for the report! :-)

-- 
You are receiving this mail because:
You are on the CC list for the bug.
