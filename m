From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon, 31 May 2021 12:29:45 +0200
Subject: [Buildroot] [PATCH 0/2] NSS & NSPR bump version
Message-ID: <20210531102947.7501-1-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patchset bumps version of both libnss and libnspr. libnss version
3.66 requires libnspr version 4.31. This patchset must be applied after
commit:
https://git.buildroot.net/buildroot/commit/?h=next&id=4eadbfeb94806b6d9b69cbc5cbfa9d6468a2eee1

Giulio Benetti (2):
  package/libnspr: bump version to 4.31
  package/libnss: bump version to 3.66

 package/libnspr/libnspr.hash | 4 ++--
 package/libnspr/libnspr.mk   | 2 +-
 package/libnss/libnss.hash   | 4 ++--
 package/libnss/libnss.mk     | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.25.1
