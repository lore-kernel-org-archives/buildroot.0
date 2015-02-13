From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Feb 2015 09:30:25 +0100
Subject: [Buildroot] [git commit branch/next] xdriver_xf86-input-evdev:
	bump version
In-Reply-To: <XnsA43FE50DD8333berndkuhlsPkbjNfxxIA@bernd-kuhls.de> (Bernd
 Kuhls's message of "Thu, 12 Feb 2015 22:31:01 +0100")
References: <20150212205752.A5828805B2@busybox.osuosl.org>
 <XnsA43FE50DD8333berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <87bnkyz00u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Peter Korsgaard <peter@korsgaard.com> wrote in 
 > news:20150212205752.A5828805B2 at busybox.osuosl.org:

 >> -XDRIVER_XF86_INPUT_EVDEV_VERSION = 2.8.2
 >> +XDRIVER_XF86_INPUT_EVDEV_VERSION = 2.8.4

 > Hi Peter,

 > what about bumping to 2.9.1?
 > http://patchwork.ozlabs.org/patch/437621/

That is also an option, but would require a bit more testing/work. I
know that the 2.9 series atleast needs libevdev.

The bump of the minor version was a lot easier/safer as it contains a
few bugfixes, so I did that while adding the mtdev support.

-- 
Bye, Peter Korsgaard
