From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 26 May 2019 20:36:08 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2019-05-08
In-Reply-To: <1558874852.local-6573d1a7-8bd6-v1.5.5-b7939d38@getmailspring.com>
References: <112312f0-39bd-e416-d8db-431b3dca27f4@mind.be>
 <1558874852.local-6573d1a7-8bd6-v1.5.5-b7939d38@getmailspring.com>
Message-ID: <20190526203608.15723248@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 26 May 2019 16:08:47 +0200
LP C <lpdev@cordier.org> wrote:

> https://git.yoctoproject.org/cgit/cgit.cgi/meta-intel/tree/recipes-multimedia/libva/intel-media-driver/0001-linux-fix-build-when-using-musl.patch
> seems to fix the issue with musl. This patch does not break the build with standard libc. As it is a patch from yocto, can I use it directly or is there any license restriction to do so?

You can use it directly, just add your own Signed-off-by below the one
of the patch author.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
