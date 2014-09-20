From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Sep 2014 15:13:42 +0200
Subject: [Buildroot] [PATCH 0/2] web: improve the sponsor page
Message-ID: <1411218824-31293-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

The intent of these two patches is to improve the look of our Sponsors
page on the website.

Before (i.e current situation) :

  http://free-electrons.com/~thomas/sponsor-page-before.png

After (i.e after applying the patches) :

  http://free-electrons.com/~thomas/sponsor-page-after.png

It would be good to apply this quickly to thank our sponsor, Mind, for
the sponsoring of the next Developers Meeting.

Thanks,

Thomas

Thomas Petazzoni (2):
  docs: move Buildroot CSS code into its own file
  docs: improve look of sponsors page

 docs/css/buildroot.css                |  36 ++++++++
 docs/header.html                      |  12 +--
 docs/images/boundary-devices-logo.png | Bin 0 -> 13305 bytes
 docs/images/calao-logo.png            | Bin 0 -> 15386 bytes
 docs/images/circuitco-logo.png        | Bin 0 -> 10750 bytes
 docs/images/fluendo-logo.png          | Bin 0 -> 9098 bytes
 docs/images/free-electrons-logo.png   | Bin 0 -> 9968 bytes
 docs/images/google-logo.png           | Bin 0 -> 12005 bytes
 docs/images/imgtec-logo.png           | Bin 0 -> 5276 bytes
 docs/images/mind-logo.png             | Bin 0 -> 10214 bytes
 docs/images/synopsys-logo.png         | Bin 0 -> 52426 bytes
 docs/sponsors.html                    | 169 +++++++++++++++++++++++++++-------
 12 files changed, 171 insertions(+), 46 deletions(-)
 create mode 100644 docs/css/buildroot.css
 create mode 100644 docs/images/boundary-devices-logo.png
 create mode 100644 docs/images/calao-logo.png
 create mode 100644 docs/images/circuitco-logo.png
 create mode 100644 docs/images/fluendo-logo.png
 create mode 100644 docs/images/free-electrons-logo.png
 create mode 100644 docs/images/google-logo.png
 create mode 100644 docs/images/imgtec-logo.png
 create mode 100644 docs/images/mind-logo.png
 create mode 100644 docs/images/synopsys-logo.png

-- 
2.0.0
