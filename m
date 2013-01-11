From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 11 Jan 2013 16:13:48 +0100
Subject: [Buildroot] [PATCH 0/3] barebox: add 2013.01.0 and lzop dependency
Message-ID: <1357917231-14194-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Fabio Porcedda (3):
  lzop: add host build
  barebox: needs host-lzop
  barebox: add 2013.01.0, remove 2012.09

 boot/barebox/Config.in  | 10 +++++-----
 boot/barebox/barebox.mk |  9 +++++----
 package/lzop/lzop.mk    |  1 +
 3 files changed, 11 insertions(+), 9 deletions(-)

-- 
1.8.0.3
