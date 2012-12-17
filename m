From: Gary Coulbourne <bear@bears.org>
Date: Mon, 17 Dec 2012 15:54:56 -0500
Subject: [Buildroot] [PATCH] allow wpa_supplicant to run on the dbus using
	the 'new' api
Message-ID: <CAEnpE0yDTQWpUf9ctGnfuSjX8PR0uX6UcxzvdV6D6uoxrAg1zQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When wpa_supplicant is built, it compiles to use the old names on the dbus,
as well as with the wrong executable name in the dbus activation service.

This patch builds on a patch submitted in Sept by Sven Neumann.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121217/e901d3a2/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-allow-wpa_supplicant-to-run-on-the-dbus-using-the-ne.patch
Type: application/octet-stream
Size: 3047 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121217/e901d3a2/attachment.obj>
