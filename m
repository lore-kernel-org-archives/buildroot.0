From: Dallas Clement <dallas.a.clement@gmail.com>
Date: Wed, 19 Sep 2012 10:34:51 -0500
Subject: [Buildroot] eaccelerator
Message-ID: <CAE9DZURE9s7eH_N2vhv1wK73Pip9wAVDmYtbU8Ynxn_3XpGpdQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All,

Can any of you provide guidance on the proper way to build a PHP
extension such as eaccelerator?  Should I create its own .mk or should
I modify the php.mk to extract into $(PHP_DIR)/ext and make all
together?  I have examined the eaccelerator tar ball contents and
there is no configure script present, so I am assuming the intent is
for it to be built with PHP.  Would appreciate any tips you might
have.

Thanks,

Dallas
