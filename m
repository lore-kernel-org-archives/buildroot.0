From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon, 2 Sep 2013 17:04:05 +0200
Subject: [Buildroot] [PATCH 1/1] systemd: bumped to version 206
In-Reply-To: <CALdGskLJPNgZ+iRokvubyE0FdG=miQHTHsdC56q84pQGcZE7Zw@mail.gmail.com>
References: <CALdGskLJPNgZ+iRokvubyE0FdG=miQHTHsdC56q84pQGcZE7Zw@mail.gmail.com>
Message-ID: <20130902150405.GB6918@pc-eric>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Sep 01, 2013 at 06:54:48PM +0200, Olivier Schonken wrote:
> I have started to test building the new version(Using Codesourcery for
> ARM).  One thing I noticed is that with the SYSTEMD_AUTORECONF=YES,
> autotools complains about undefined macro AM_PATH_LIBGCRYPT if libgcrypt or
> libgcrypt-devel is not present on the build system.  Not sure how to go
> about pleasing autotools without the additional system dependency.  Maybe
> someone on the buildroot mailing list will know...?

I removed libgcrypt11-dev from my development machine and built an image for
QEMU arm-versatile using Code Sourcery 2013.05, but I have not seen this issue.
Can you send me a log file of the build with the error?
