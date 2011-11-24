From: Trevor Woerner <twoerner@gmail.com>
Date: Thu, 24 Nov 2011 15:47:23 -0500
Subject: [Buildroot] commit bf4465 (ncurses: fix hanging installation
 due to old version of tic)
Message-ID: <CAHUNapT5XD1ghKZgfH1nVsiOEqpjfxUcTTHp5NCNa_C7+rEEJg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that ncurses depends on host-ncurses I was wondering if it also
needs to depend on host-automake and/or host-pkg-config?

Could $(call AUTOTARGETS,host) be tweaked to automatically include
host-automake implicitly?
