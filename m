From: =?UTF-8?B?RGFuaWVsIE55c3Ryw7Zt?= <daniel.nystrom@timeterminal.se>
Date: Wed, 08 Oct 2008 14:52:20 +0200
Subject: [Buildroot] Both cramfs + jffs2 in buildroot?
Message-ID: <48ECAD04.6070209@timeterminal.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

(Sorry if this has been a topic earlier, but it's really hard to search
the mailing archive)

Is it possible in Buildroot to make both a read-only rootfs and a second
writable filesystem?

A common setup is using cramfs for / and mounting a jffs2 on /mnt/flash,
and then make a symlink of /etc to point at /mnt/flash/etc where all
config files are writable.

Is this possible to achive with Buildroot?
