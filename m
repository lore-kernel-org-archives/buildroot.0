From: Titouan Christophe <titouanchristophe@gmail.com>
Date: Sun, 24 Jan 2021 11:57:34 +0100
Subject: [Buildroot] [PATCH 0/2] package/x11r7/{libxcb,
 xcb-proto}: use host-python3
Message-ID: <20210124105736.33533-1-titouanchristophe@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Building these packages with Python3 seems to be supported upstream for a
few years now, so we can remove two more host-python(2) dependencies here.

Titouan Christophe (2):
  package/x11r7/xcb-proto: use host-python3 instead of host-python(2)
  package/x11r7/libxcb: Use host-python3 instead of host-python(2)

 package/x11r7/libxcb/libxcb.mk       | 10 +++++-----
 package/x11r7/xcb-proto/xcb-proto.mk |  8 ++++++--
 2 files changed, 11 insertions(+), 7 deletions(-)

-- 
2.25.3
