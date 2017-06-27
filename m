From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 27 Jun 2017 09:53:07 +0200
Subject: [Buildroot] [PATCH v2 0/2] qt5multimedia: add missing dependencies
Message-ID: <1498549990-3548-1-git-send-email-brgl@bgdev.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Qt5Multimedia conditionally builds support for pulseaudio and alsa if
it detects corresponding libraries in the system but we need to
explicitly depend on these packages.

v1 -> v2:
- also added libglib2 as dependency for pulseaudio support
- new patch: add alsa to dependencies

Bartosz Golaszewski (2):
  qt5multimedia: conditionally add pulseaudio & libglib2 to dependencies
  qt5multimedia: conditionally add alsa-lib to dependencies

 package/qt5/qt5multimedia/qt5multimedia.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

-- 
2.9.3
