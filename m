From: Adrian Perez de Castro <aperez@igalia.com>
Date: Sat, 21 Sep 2019 00:38:22 +0300
Subject: [Buildroot] [PATCH 0/4] Update WPE WebKit to 2.26.0 (and its
 related components)
Message-ID: <20190920213826.2531495-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

This patch set updates WPE WebKit to 2.26.0, bringing in along the way
the needed updates for its dependencies (libwpe & wpebackend-fdo 1.4.0)
and for the Cog launcher/browser (0.4.0).

Nothing too special here other than disabling some of the new features
which require new dependencies. After this is merged, I will be enabling
them with follow-up patches (like I have started doing for WebKitGTK).

As usual, feedback and questions welcome =)

Best regards,


Adrian Perez de Castro (4):
  package/libwpe: bump to version 1.4.0
  package/wpebackend-fdo: bump to version 1.4.0
  package/wpewebkit: bump to version 2.26.0
  package/cog: bump to version 0.4.0

 package/cog/cog.hash                       | 8 ++++----
 package/cog/cog.mk                         | 5 +++--
 package/libwpe/libwpe.hash                 | 8 ++++----
 package/libwpe/libwpe.mk                   | 2 +-
 package/wpebackend-fdo/wpebackend-fdo.hash | 8 ++++----
 package/wpebackend-fdo/wpebackend-fdo.mk   | 2 +-
 package/wpewebkit/wpewebkit.hash           | 8 ++++----
 package/wpewebkit/wpewebkit.mk             | 4 +++-
 8 files changed, 24 insertions(+), 21 deletions(-)

-- 
2.23.0
