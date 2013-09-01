From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Sun, 1 Sep 2013 18:54:48 +0200
Subject: [Buildroot] [PATCH 1/1] systemd: bumped to version 206
Message-ID: <CALdGskLJPNgZ+iRokvubyE0FdG=miQHTHsdC56q84pQGcZE7Zw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Eric

Great work on bumping systemd to version 206.

I have started to test building the new version(Using Codesourcery for
ARM).  One thing I noticed is that with the SYSTEMD_AUTORECONF=YES,
autotools complains about undefined macro AM_PATH_LIBGCRYPT if libgcrypt or
libgcrypt-devel is not present on the build system.  Not sure how to go
about pleasing autotools without the additional system dependency.  Maybe
someone on the buildroot mailing list will know...?

Regards
Olivier Schonken
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130901/bd235995/attachment.html>
