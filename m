From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 Sep 2020 20:43:04 +0200
Subject: [Buildroot] [PATCH 1/1] package/imagemagick: security bump to
 version 7.0.10-28
In-Reply-To: <20200830115813.303999-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 30 Aug 2020 13:58:13 +0200")
References: <20200830115813.303999-1-fontaine.fabrice@gmail.com>
Message-ID: <87wo1d8hjb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Fix CVE-2019-17547: In ImageMagick before 7.0.8-62, TraceBezier in
 >   MagickCore/draw.c has a use-after-free.
 > - Fix CVE-2019-18853: ImageMagick before 7.0.9-0 allows remote attackers
 >   to cause a denial of service because XML_PARSE_HUGE is not properly
 >   restricted in coders/svg.c, related to SVG and libxml2.
 > - Update hash of LICENSE file (update in year with
 >   https://github.com/ImageMagick/ImageMagick/commit/f775a5cf27a95c42bb6d19b50f4869db265fdaa9)
 > - Update indentation in hash file (two spaces)

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
