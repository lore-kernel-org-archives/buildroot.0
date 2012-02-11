From: Felipe Contreras <felipe.contreras@gmail.com>
Date: Sat, 11 Feb 2012 02:04:33 +0200
Subject: [Buildroot] [PATCH 0/3] Random updates
Message-ID: <1328918676-19482-1-git-send-email-felipe.contreras@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Here's a bunch of updates. The first one can be consiered a fix, the second one
is convenient, and the third one makes more proper usage of .gitignore.

Cheers.

Felipe Contreras (3):
  gst-dsp: add dependency to pkg-config
  gst-plugins-base: add option to select 'alsa'
  .gitignore: remove wrong entries

 .gitignore                                    |    7 -------
 package/multimedia/gst-dsp/gst-dsp.mk         |    2 +-
 package/multimedia/gst-plugins-base/Config.in |    7 ++++++-
 3 files changed, 7 insertions(+), 9 deletions(-)

-- 
1.7.9.1.g97f7d
