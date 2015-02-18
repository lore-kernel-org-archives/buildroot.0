From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 18 Feb 2015 09:28:11 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2015-02-17
In-Reply-To: <20150218073015.D72C71011D7@stock.ovh.net>
References: <20150218073015.D72C71011D7@stock.ovh.net>
Message-ID: <54E44D1B.6080802@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello everyone,

On 18/02/15 08:30, Thomas Petazzoni wrote:
> Build statistics for 2015-02-17
> ===============================

>     mips64el |                sdl_sound-1.0.3 | NOK | http://autobuild.buildroot.net/results/96c10335489fb27e15c493c6b148e4988bc89e63/

This package fails for all architectures when building it with debug
symbols. I reported this upstream long time ago:

http://lists.libsdl.org/pipermail/sdl-libsdl.org/2014-November/096804.html

We also had a little discussion in our mailing list:

https://patchwork.ozlabs.org/patch/400969/

Should we disable this package when BR2_ENABLE_DEBUG=y until upstream
fixes the problem?

Regards,
--
Vincent
