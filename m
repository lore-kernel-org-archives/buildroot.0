From: aduskett at gmail.com <aduskett@gmail.com>
Date: Mon,  1 Jul 2019 18:09:58 -0400
Subject: [Buildroot] [PATCH 0/1] convert gstreamer1 package and plugins to
 meson
Message-ID: <20190701221004.99862-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

This patch series converts gstreamer1 and the plugins
(base, good, bad, and ugly) to meson. The reason to do this is because 1.16.0
is the last version that will support autotools.

Hopefully this looks clean enough to merge. I will have a few other subsequent
patches to submit after the initial meson conversion is complete, but so far
I am happy with the results.


Adam Duskett (1):
  package/gstreamer1/gstreamer1: Convert package to meson

 package/gstreamer1/gstreamer1/gstreamer1.mk | 32 ++++++++++++---------
 1 file changed, 19 insertions(+), 13 deletions(-)

-- 
2.21.0
