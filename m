From: kyle nahrgang <kyle.nahrgang@gmail.com>
Date: Fri, 24 Jul 2020 08:38:18 -0400
Subject: [Buildroot] including full external-toolchain
Message-ID: <CAE0kWpANCLgJ_wrw6C0KaEzMEvJoMHa_WkGpNAv29xjB+CFZVw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In an effort to reduce my build time, I've switched to building an external
toolchain separately from my other projects. When I import this toolchain,
I notice that only the cross compilation tools get linked, and all other
host utilities are rebuilt.

Is there a reason that buildroot doesn't import all of the host utilities?
Or skip host dependencies that are already installed in the host output?
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200724/315bac70/attachment.html>
