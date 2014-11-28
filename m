From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Nov 2014 22:13:49 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/x11r7/xapp_bdftopcf: Fix
	linking error
In-Reply-To: <1417199770-6206-1-git-send-email-bernd.kuhls@t-online.de> (Bernd
 Kuhls's message of "Fri, 28 Nov 2014 19:36:10 +0100")
References: <1417199770-6206-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <871tonkoz6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Fixes
 > http://autobuild.buildroot.net/results/242/24297c948c0eee684e868ad4bd12f11c3a759248/
 > http://autobuild.buildroot.net/results/464/464fdc71690a437c1782dd8e4c75d78195bf8bfd/
 > http://autobuild.buildroot.net/results/77c/77c26d14c8906b44f7c3fa1b3d759556c7318a7e/
 > and many others ( http://autobuild.buildroot.net/?reason=xapp_bdftopcf-1.0.4 )

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 > v2: Change LDFLAGS to LIBS (Peter)

Committed, thanks.

-- 
Bye, Peter Korsgaard
