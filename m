From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 14 Jan 2014 22:45:36 +0100
Subject: [Buildroot] [PATCH 1/1] ffmpeg: Add mips related configure
	options to fix build errors
In-Reply-To: <BLU0-SMTP28034465E483AA8202634E5D9BC0@phx.gbl> (Bernd Kuhls's
 message of "Mon, 13 Jan 2014 22:23:06 +0100")
References: <BLU0-SMTP28034465E483AA8202634E5D9BC0@phx.gbl>
Message-ID: <8738kqxmnz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <berndkuhls@hotmail.com> writes:

 > http://autobuild.buildroot.net/results/aa5/aa5cb447342af9995d8f198eb0a151fe6e3d5c19//
 > http://autobuild.buildroot.net/results/355/355f56f6b466521e2c4c71f69b06a0ca2a56949b//

 > Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
 > ---
 > The patch is only compile-tested using defconfig from autobuild results quoted above.

I also don't know much about mips, but it looks good from a quick test -
Committed, thanks.

-- 
Bye, Peter Korsgaard
