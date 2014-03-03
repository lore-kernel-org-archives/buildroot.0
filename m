From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Mar 2014 21:40:47 +0100
Subject: [Buildroot] [git commit] website: add Bootstrap and JQuery
	frameworks
Message-ID: <20140303204144.CB9629BCC1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=84dadd7073324c5c5f4490501c506a4f0e6e42f0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add Bootstrap framework, along with JQuery.

Theses files were downloaded from:
  - http://getbootstrap.com
  - http://jquery.com/

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/css/bootstrap-responsive.css          | 1092 +++++
 docs/css/bootstrap-responsive.min.css      |    9 +
 docs/css/bootstrap.css                     | 6039 ++++++++++++++++++++++++++++
 docs/css/bootstrap.min.css                 |  882 ++++
 docs/css/bootswatch.less                   |  181 +
 docs/css/variables.less                    |  301 ++
 docs/images/glyphicons-halflings-white.png |  Bin 0 -> 8777 bytes
 docs/images/glyphicons-halflings.png       |  Bin 0 -> 12799 bytes
 docs/images/menuconfig.png                 |  Bin 9087 -> 8604 bytes
 docs/js/bootstrap.js                       | 2159 ++++++++++
 docs/js/bootstrap.min.js                   |    6 +
 docs/js/jquery-1.10.2.min.js               |    6 +
 12 files changed, 10675 insertions(+), 0 deletions(-)

Patch is too large, so refusing to show it
