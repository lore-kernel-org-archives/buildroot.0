From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 19 Aug 2014 15:48:07 -0300
Subject: [Buildroot] [PATCH 0/4] Ncurses wide support
Message-ID: <1408474091-25947-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is the compiled series for ncurses wide support.
Tested a while ago with an allyespackageconfig.
Closes bug #6950

Gustavo Zacarias (3):
  package/ncurses: fixup wide support for static targets
  nano: enable ncursesw support
  httping: enable ncurses support

Jeremy Kerr (1):
  package/ncurses: Allow building wide char support

 package/httping/httping.mk |  3 ++-
 package/nano/nano.mk       |  9 +++++++--
 package/ncurses/Config.in  |  8 ++++++++
 package/ncurses/ncurses.mk | 33 +++++++++++++++++++++++++++++++--
 4 files changed, 48 insertions(+), 5 deletions(-)

-- 
1.8.5.5
