From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 26 Feb 2009 09:05:58 +0100
Subject: [Buildroot] [PATCH] gst-plugins-good: remove dependencies for
	matroska plugin
In-Reply-To: <200902260225.11224.markus.heidelberg@web.de> (Markus
	Heidelberg's message of "Thu\, 26 Feb 2009 02\:25\:11 +0100")
References: <200902260225.11224.markus.heidelberg@web.de>
Message-ID: <87ljrtmxll.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Markus" == Markus Heidelberg <markus.heidelberg@web.de> writes:

Hi,

 Markus> This was forgotten when adding config options for zlib and bzip2. The
 Markus> matroska plugin doesn't need these dependencies, they are optional.

Thanks, committed as r25458.

-- 
Bye, Peter Korsgaard
