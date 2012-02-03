From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Fri,  3 Feb 2012 15:27:22 +0100
Subject: [Buildroot] [RFC v2] Add systemd to buildroot
Message-ID: <1328279247-7277-1-git-send-email-maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

This is an update for the previous systemd RFC I sent some time ago.
The installation have changed a bit. Since systemd needs also symlinks
to be placed in targets' folders so that it can run them. So now, two
hooks are defined and called wether systemd or a sysv init system has
been selected.

Also, this is now functionnal, so you can test it right now.

I've also added various examples of unit files, and along the way
corrected the package definition of lighttpd that was non-functionnal
as is.

So, please take a look and review!
Maxime
