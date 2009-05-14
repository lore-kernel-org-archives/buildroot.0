From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 14 May 2009 08:13:07 +0000 (UTC)
Subject: [Buildroot] [Bug 303] add gvfs package
In-Reply-To: <bug-303-163@https.bugs.busybox.net/>
References: <bug-303-163@https.bugs.busybox.net/>
Message-ID: <20090514081307.5AB647781C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=303





--- Comment #4 from Sven Neumann <s.neumann@raumfeld.com>  2009-05-14 08:13:06 UTC ---
Created an attachment (id=325)
 --> (https://bugs.busybox.net/attachment.cgi?id=325)
patch to make the http and webdav backends compile with libsoup-2.4.1

The http and webdav backends of gvfs depend on libsoup-gnome. libsoup-gnome is
libsoup with some small API additions. The main point is to respect the HTTP
proxy configuration of the GNOME desktop. This patch makes some small
adjustments to the configure script and to the code so that the backends will
compile with plain libsoup version 2.4.1 as included in buildroot.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
