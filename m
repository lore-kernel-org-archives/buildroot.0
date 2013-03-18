From: Simon Dawson <spdawson@gmail.com>
Date: Mon, 18 Mar 2013 11:01:24 +0000
Subject: [Buildroot] Problems with zeromq 3.2.2
Message-ID: <CAHt8ZCM0W1Lnn4LotB8QYp90J3CgUjR4VL17WnPLum6M9Q0E8Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The zeromq package was recently bumped from version 2.2.0 to
version 3.2.2. Unfortunately, zeromq 3.x.x is not backward-compatible
with client code developed to use version 2.2.x. For example, it
appears that the C++ binding has been removed, and is now available as
a separate project.

For my particular use case, I need the C++ binding, and would prefer to
remain using the 2.2.x branch.

I'm wondering if we should have separate packages in Buildroot for
zeromq versions 2.2.x and "latest supported". Does anybody have any
objections? I suppose the alternative is to try to understand the
complex system of zeromq sub-projects, in order to re-instate the C++
binding which has been lost in the seemingly-innocuous version bump.

Simon.
