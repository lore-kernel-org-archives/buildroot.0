From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sat, 28 Sep 2019 20:36:29 +0300
Subject: [Buildroot] [PATCH 0/3] Fix hostapd v2.9 build issues
Message-ID: <20190928173632.21119-1-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Matt, and all

This patch set is aimed at fixing the remaining hostapd build failures
for new hostapd v2.9. The first commit is supposed to fix the following
build failures:

http://autobuild.buildroot.net/results/36e6e2662f89024defa83749d102d093b1f0a637/
http://autobuild.buildroot.net/results/f39a45e1e6ddcd5b3438f52e14ee78872775823b/
http://autobuild.buildroot.net/results/f5dff2e7321568f0555ee3b975ff83bb9536fedf/

The second patch fixes possible build issue that has not yet been
spotted by the autobuild system.

Sergey Matyukevich (3):
  package/hostapd: enable Linux ioctls for VLANs
  package/hostapd: disable TEAP for internal TLS implementation
  DEVELOPERS: add Sergey Matyukevich for hostapd/wpa_supplicant

 DEVELOPERS                 | 2 ++
 package/hostapd/hostapd.mk | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

-- 
2.23.0
