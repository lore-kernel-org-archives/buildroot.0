From: Christopher McCrory <chrismcc@gmail.com>
Date: Mon, 20 Aug 2018 04:16:20 -0700
Subject: [Buildroot] [PATCH 0/3] scancpan patches
Message-ID: <20180820111623.23173-1-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

0001-scancpan-wrap-abstract-if-too-long.patch
updated to use 62 columns as requested

0002-scancpan-skip-Dist-Zilla.patch
better check as sugested by Fran?ois

0003-scancpan-support-more-licenses.patch
respun without ambiguous choices


Christopher McCrory (3):
  scancpan: wrap abstract if too long
  scancpan: skip Dist::Zilla
  scancpan: support more licenses

 utils/scancpan | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

-- 
2.14.4
