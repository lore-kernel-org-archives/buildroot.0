From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 27 Mar 2013 14:24:00 +0000 (UTC)
Subject: [Buildroot] [Bug 6140] --enable-fileinfo not applied for php package
In-Reply-To: <bug-6140-163@https.bugs.busybox.net/>
References: <bug-6140-163@https.bugs.busybox.net/>
Message-ID: <20130327142400.A68509B338@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6140

Aleksandar <aleksandar.zivkovic@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED

--- Comment #1 from Aleksandar <aleksandar.zivkovic@gmail.com> 2013-03-27 14:24:45 UTC ---
Issue is in http://git.buildroot.net/buildroot/tree/package/php/php.mk:60:
-        $(if $(BR2_PACKAGE_PHP_EXT_FILENIFO),--enable-fileinfo) \
+        $(if $(BR2_PACKAGE_PHP_EXT_FILEINFO),--enable-fileinfo) \

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
