From: Baruch Siach <baruch@tkos.co.il>
Date: Wed,  6 Aug 2014 21:31:02 +0300
Subject: [Buildroot] [PATCH 2/2] python: renumber patch
In-Reply-To: <5bbe7610b89e16341ca9456ae5b8aad67652b61b.1407349862.git.baruch@tkos.co.il>
References: <5bbe7610b89e16341ca9456ae5b8aad67652b61b.1407349862.git.baruch@tkos.co.il>
Message-ID: <dc58f121c9ce97ddacc9ef77c91fc8795b1fe95c.1407349862.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Advance the serial number of a patch from 015 to 016 to avoid collision and
confusion.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...al-ioctl-workaround.patch => python-016-serial-ioctl-workaround.patch} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename package/python/{python-015-serial-ioctl-workaround.patch => python-016-serial-ioctl-workaround.patch} (100%)

diff --git a/package/python/python-015-serial-ioctl-workaround.patch b/package/python/python-016-serial-ioctl-workaround.patch
similarity index 100%
rename from package/python/python-015-serial-ioctl-workaround.patch
rename to package/python/python-016-serial-ioctl-workaround.patch
-- 
2.0.1
