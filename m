From: Jordi Llonch <llonchj@gmail.com>
Date: Sat, 2 Aug 2014 12:26:35 +1000
Subject: [Buildroot] Multiple versions of packages
Message-ID: <CAMocaJC9XO6mXhuAs_F4r_ZR081--fXvh87iT4e3wW8eX7j1rg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

For a particular use case, I need to build different minor versions for the
same package.

The most notable example is mainly for interpreted languages: PHP, 5.5.x,
5.4.x, 5.3.x, ruby, etc. also for mysql or other packages where state can
be incompatible across versions.

I have implemented packages like "php53" and "php54" in a BR2_EXTERNAL. I
am looking for better approaches on how to do this.

Any thoughts or ideas?

Jordi
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140802/efd8cfa3/attachment.html>
