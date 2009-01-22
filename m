From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 22 Jan 2009 10:13:28 +0100
Subject: [Buildroot] svn commit:
	trunk/buildroot/package/multimedia/gst-plugins-good
In-Reply-To: <200901221009.18267.markus.heidelberg@web.de> (Markus
	Heidelberg's message of "Thu\, 22 Jan 2009 10\:09\:18 +0100")
References: <20090121133322.0FFA4770FC@busybox.osuosl.org>
	<200901221009.18267.markus.heidelberg@web.de>
Message-ID: <87vds7og93.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Markus" == Markus Heidelberg <markus.heidelberg@web.de> writes:

Hi,

 Markus> This plugin is listed at the dependency-less plugins, so it
 Markus> should not need to depend on any external library. Looking at
 Markus> gst/matroska/matroska-demux.c, I can see that it is an
 Markus> optional dependency with #ifdef HAVE_ZLIB and #ifdef
 Markus> HAVE_BZ2.

 Markus> There are the --disable-zlib and --disable-bz2 configure
 Markus> options, probably these should be used? I'll send a patch.

Please do. I agree with all your comments.

-- 
Bye, Peter Korsgaard
