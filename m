From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Dec 2017 09:14:32 +0100
Subject: [Buildroot] [PATCH] axel: bump to version 2.16
In-Reply-To: <20171125044447.7188-1-ismael@iodev.co.uk>
References: <20171125044447.7188-1-ismael@iodev.co.uk>
Message-ID: <20171204091432.6e44856c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 25 Nov 2017 01:44:47 -0300, Ismael Luceno wrote:
> - Change upstream URL.
> - Add optional dependency on libressl/openssl.
> - Switch to autotools-package.
> 
> Signed-off-by: Ismael Luceno <ismael@iodev.co.uk>

This update broke the build:

  http://autobuild.buildroot.net/?reason=axel-2.16

Could you look into it? Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
