From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 20 Aug 2014 11:06:17 -0300
Subject: [Buildroot] [PATCHv2 0/4] Ncurses wide support
Message-ID: <1408543581-15702-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is the compiled series for ncurses wide support.
Tested a while ago with an allyespackageconfig.
Closes bug #6950

Changes for v2:
  Make the static fix patch also do it for dynamic targets as well

Gustavo Zacarias (3):
  package/ncurses: fixup library symlink for static libs
  nano: enable ncursesw support
  httping: enable ncurses support

Jeremy Kerr (1):
  package/ncurses: Allow building wide char support

 package/httping/httping.mk |  3 ++-
 package/nano/nano.mk       |  9 +++++++--
 package/ncurses/Config.in  |  8 ++++++++
 package/ncurses/ncurses.mk | 35 +++++++++++++++++++++++++++++++++--
 4 files changed, 50 insertions(+), 5 deletions(-)

-- 
1.8.5.5
