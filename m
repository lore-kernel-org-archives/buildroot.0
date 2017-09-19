From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 19 Sep 2017 20:45:36 +0200
Subject: [Buildroot] [PATCH 0/4] package/tor: bump version to 0.3.1.7
Message-ID: <20170919184540.23337-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

this series bumps the tor package to its current stable release:
https://blog.torproject.org/tor-0317-now-released

The optional zstd support was tested with these additional patches
http://patchwork.ozlabs.org/patch/814260/
http://patchwork.ozlabs.org/patch/814442/

which should be committed before this series.

Regards, Bernd

Bernd Kuhls (4):
  package/tor: bump version to 0.3.1.7
  package/tor: add optional support for lzma
  package/zstd: enable library build and staging install
  package/tor: add optional support for zstd

 package/tor/0001-openssl-libz.patch | 124 +++++++++++++++++++-----------------
 package/tor/tor.hash                |   2 +-
 package/tor/tor.mk                  |  16 ++++-
 package/zstd/zstd.mk                |  10 ++-
 4 files changed, 90 insertions(+), 62 deletions(-)

-- 
2.11.0
