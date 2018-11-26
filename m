From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Nov 2018 09:50:22 +0100
Subject: [Buildroot] [PATCH] package/x11r7/xlib_libfontenc: add missing
 dependency on host-pkgconf
In-Reply-To: <20181113145255.6471-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Tue, 13 Nov 2018 15:52:55 +0100")
References: <20181113145255.6471-1-thomas.petazzoni@bootlin.com>
Message-ID: <87lg5gz0hd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > The xlib_libfontenc configure.ac uses PKG_CHECK_MODULES(), but the
 > Buildroot package does not have a dependency on host-pkgconf. This
 > causes a build failure with per-package host/target folders, or if one
 > builds just with "make xlib_libfontenc", which is why it was never
 > detected by the autobuilders.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.02.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
