From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@openwide.fr>
Date: Wed, 29 May 2013 09:11:56 +0200
Subject: [Buildroot] [PATCH 0/2] Bump pulseaudio and dependencies
Message-ID: <1369811518-31896-1-git-send-email-jeremy.rosen@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This serie of patch will bump pulseaudio to version 3.0

pulseaudio needs a newer version of libtool, so also bump this

v2: rebase on next instead of master

J?r?my Rosen (2):
  libtool : bump to version 2.4.2
  pulseaudio : bump to version 3.0

 package/libtool/libtool.mk                  |    2 +-
 package/multimedia/pulseaudio/pulseaudio.mk |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

-- 
1.7.10.4
