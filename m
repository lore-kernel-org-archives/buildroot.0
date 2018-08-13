From: Christopher McCrory <chrismcc@gmail.com>
Date: Mon, 13 Aug 2018 06:11:33 -0700
Subject: [Buildroot] [RFC PATCH 0/2] scancpan patches
Message-ID: <20180813131135.32651-1-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These should help scancpan do the right thing.
Tested on perl-astro-suntime, gpl_3
and perl-appconfig, Config.in desciption too long

Christopher McCrory (2):
  scancpan: support more licenses
  scancpan: wrap abstract if too long

 utils/scancpan | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

-- 
2.14.4
