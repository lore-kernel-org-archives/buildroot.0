From: Daniel Mack <zonque@gmail.com>
Date: Mon, 30 May 2011 20:16:28 +0200
Subject: [Buildroot] Add two more packages
Message-ID: <1306779390-19947-1-git-send-email-zonque@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I originally wanted to bring udev to a newer version, but appearantly,
there's something broken with epoll in uclibc, so I postponed it.

However, I already added two packages which are dependencies to newer
versions of udev, and I think they could be merged independently.


Daniel

[PATCH 1/2] Add package acl
[PATCH 2/2] Add package attr
