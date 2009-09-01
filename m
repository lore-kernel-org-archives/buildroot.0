From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  1 Sep 2009 15:18:23 +0000 (UTC)
Subject: [Buildroot] [Bug 527] misc fixes for dnsmasq package
In-Reply-To: <bug-527-163@https.bugs.busybox.net/>
References: <bug-527-163@https.bugs.busybox.net/>
Message-ID: <20090901151823.91C897777A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=527





--- Comment #17 from Gustavo Zacarias <gustavo@zacarias.com.ar>  2009-09-01 15:18:21 UTC ---
Created an attachment (id=625)
 --> (https://bugs.busybox.net/attachment.cgi?id=625)
dnsmasq 2.50 Makefile.autotools.in plus some other improvements

How do you like this take Daniele / Peter?

* Bump to version 2.50 fixes security issues CVE 2009-2957 and 2009-2958.
* No need for INSTALL_STAGING
* Add uninstall target
* Use PREFIX=/usr to avoid files in /usr/local
* Install manpage conditionally
* Introduce new DHCP server option
* Add Peter's dbus fix (not tested, i don't use dbus)


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
