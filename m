From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Oct 2017 23:55:17 +0200
Subject: [Buildroot] [PATCH 1/1] package/imagemagick: security bump to
	version 7.0.7-1
In-Reply-To: <20170917091652.18140-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sun, 17 Sep 2017 11:16:52 +0200")
References: <20170917091652.18140-1-bernd.kuhls@t-online.de>
Message-ID: <8760besqpm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Quoting CVE-related issues from
 > https://github.com/ImageMagick/ImageMagick/blob/master/ChangeLog

 > 2017-07-29 7.0.6-5 Glenn Randers-Pehrson <glennrp@image...>
 >   * Fix improper use of NULL in the JNG decoder (CVE-2017-11750, Reference
 >     https://github.com/ImageMagick/ImageMagick/issues/632).

 > 2017-07-24 7.0.6-4 Cristy <quetzlzacatenango@image...>
 >   * Fixed numerous memory leaks (reference
 >     https://github.com/ImageMagick/ImageMagick/issues) including
 >     https://github.com/ImageMagick/ImageMagick/issues/618 (CVE-2017-12676).

 > 2017-07-23  7.0.6-3 Glenn Randers-Pehrson <glennrp@image...>
 >   * Fix memory leaks when reading a malformed JNG image:
 >     https://github.com/ImageMagick/ImageMagick/issues/600 (CVE-2017-13141),
 >     https://github.com/ImageMagick/ImageMagick/issues/602 (CVE-2017-12565).

 > 2017-07-19 7.0.6-2 Cristy <quetzlzacatenango@image...>
 >   * coders/png.c: fixed memory leak of quantum_info (CVE-2017-11539, reference
 >     https://github.com/ImageMagick/ImageMagick/issues/582
 >   * coders/png.c: fixed NULL dereference when trying to write an empty MNG
 >     (CVE-2017-11522, reference
 >     https://github.com/ImageMagick/ImageMagick/issues/586).

 > 2017-06-22  7.0.6-1 Glenn Randers-Pehrson <glennrp@image...>
 >   * Stop a memory leak in read_user_chunk_callback() (reference
 >     https://github.com/ImageMagick/ImageMagick/issues/517,
 >     CVE 2017-11310).

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2017.08.x, thanks.

-- 
Bye, Peter Korsgaard
