From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 14 Mar 2017 00:09:31 +0100
Subject: [Buildroot] [PATCH] imagemagick: bump version to 7.0.5-0
	(security)
In-Reply-To: <20170310215229.556a6431@free-electrons.com> (Thomas Petazzoni's
 message of "Fri, 10 Mar 2017 21:52:29 +0100")
References: <20170310170618.18297-1-Vincent.Riera@imgtec.com>
 <20170310215229.556a6431@free-electrons.com>
Message-ID: <8737egydsk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Fri, 10 Mar 2017 17:06:18 +0000, Vicente Olivert Riera wrote:
 >> - Fixed memory leak when creating nested exceptions in Magick++
 >> https://www.imagemagick.org/discourse-server/viewtopic.php?f=23&p=142634
 >> 
 >> - Fixed fd leak for webp coder
 >> https://github.com/ImageMagick/ImageMagick/pull/382
 >> 
 >> - Fixed Spurious memory allocation message
 >> https://www.imagemagick.org/discourse-server/viewtopic.php?f=3&t=31438
 >> 
 >> Full changelog: http://imagemagick.org/script/changelog.php
 >> 
 >> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 >> ---
 >> ...-png.c-unbreak-build-without-JPEG-support.patch | 47 ----------------------
 >> package/imagemagick/imagemagick.hash               |  2 +-
 >> package/imagemagick/imagemagick.mk                 |  2 +-
 >> 3 files changed, 2 insertions(+), 49 deletions(-)
 >> delete mode 100644 package/imagemagick/0001-png.c-unbreak-build-without-JPEG-support.patch

 > Applied to master, thanks. Peter: this one is needed for the LTS branch
 > I believe.

Agreed. Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
