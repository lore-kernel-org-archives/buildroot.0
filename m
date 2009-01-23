From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 23 Jan 2009 10:18:12 +0100
Subject: [Buildroot] svn commit:
	trunk/buildroot/package/multimedia/gst-plugins-good
In-Reply-To: <200901222217.57888.markus.heidelberg@web.de> (Markus
	Heidelberg's message of "Thu\, 22 Jan 2009 22\:17\:57 +0100")
References: <20090122110159.E9877765E9@busybox.osuosl.org>
	<200901222217.57888.markus.heidelberg@web.de>
Message-ID: <87fxjamld7.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Markus" == Markus Heidelberg <markus.heidelberg@web.de> writes:

 >> Log:
 >> package/multimedia/gst-plugins-good/Config.in
 >> package/multimedia/gst-plugins-good/gst-plugins-good.mk

 Markus> It probably doesn't make sense to include the filenames in the commit
 Markus> message, let alone full paths. The VCS knows them anyway.

I agree - It's good to prefix the commit message with what's it about
(E.G. gst-plugins-good:) to make it easy to find back (E.G. in gitk),
but not the individual file names.

 Markus> Also, please keep the order of the config options identically between
 Markus> the files for Kconfig and Make.
 Markus> In Config.in you have : jpeg, png, bz2, zlib
 Markus> In gst-plugins-good.mk: bz2, zlib, jpeg, png

 Markus> With this big amount of options, it could get distracting, when
 Markus> extending the package or searching for bugs.

Agree.

-- 
Bye, Peter Korsgaard
