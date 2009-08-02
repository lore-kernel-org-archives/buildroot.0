From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  2 Aug 2009 23:12:58 +0000 (UTC)
Subject: [Buildroot] [Bug 355] Please update WebKit - it doesn't compile!
In-Reply-To: <bug-355-163@https.bugs.busybox.net/>
References: <bug-355-163@https.bugs.busybox.net/>
Message-ID: <20090802231258.C94BD777DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=355





--- Comment #6 from Dan Dart <dandart@googlemail.com>  2009-08-02 23:12:58 UTC ---
How now do I get it to work? I get:

checking for libintl.h... no
configure: error:
*** You must have either have gettext support in your C library, or use the
*** GNU gettext library. (http://www.gnu.org/software/gettext/gettext.html

Where is it looking? I have /usr/include/libintl.h in the libc6-dev package and
gettext installed.

Using Ubuntu 9.04.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
