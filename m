From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 26 Jun 2015 05:58:52 +0200
Subject: [Buildroot] [PATCH v4 0/2] Top-level parallel makefile improvements
Message-ID: <1435291134-6780-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,
this patch set improve top-level parallel makefile support.

v4:
 - add a patch for luarocks packages
v3:
 - add Acked-by (Arnout)
v2:
 - use MAKEFLAGS to check if the "-j" option is used
 - don't empty the PARALLEL_JOBS variable (Thomas P.)

Fabio Porcedda (2):
  packages: fix and improve support for top-level parallel makefile
  pkg-luarocks: fix top-level parallel makefile support

 Makefile                     | 4 ++--
 package/Makefile.in          | 3 ++-
 package/luarocks/luarocks.mk | 6 ++++--
 package/pkg-luarocks.mk      | 4 ++--
 4 files changed, 10 insertions(+), 7 deletions(-)

-- 
2.4.3
