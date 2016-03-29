From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 29 Mar 2016 09:39:05 -0300
Subject: [Buildroot] [PATCH v2 0/6] Weston package enhancement
Message-ID: <1459255151-17084-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changes for v2:
* Add libdrm dependency for DRM compositor
* Add weston-launch support
* Drop useless --disable-xwayland-test

Gustavo Zacarias (6):
  weston: add EGL support
  weston: set default backend for fbdev
  weston: add DRM compoitor support
  weston: handle optional libva support
  weston: add weston-launch support
  weston: drop --disable-xwayland-test

 package/weston/Config.in | 10 ++++++++++
 package/weston/weston.mk | 47 ++++++++++++++++++++++++++++++++++++++---------
 2 files changed, 48 insertions(+), 9 deletions(-)

-- 
2.7.3
